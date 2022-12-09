import 'package:flutter/material.dart';

import 'helper.dart';

class Modal extends StatefulWidget {
  Modal(
      {super.key,
      required this.content,
      this.showModal = false,
      this.timeDelay = false})
      : assert(
            !timeDelay && !showModal ||
                timeDelay && !showModal ||
                !timeDelay && showModal,
            "Error: Both timeDelay and showModal can not be true at the same time");

  final Widget content;
  bool showModal;
  bool timeDelay;

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  late OverlayEntry overlayEntry;

  void hideOverlay() {
    overlayEntry.remove();
  }

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return FractionallySizedBox(
          // Covers the whole screen
          child: Container(
            // "Smokes" out the background
            color: const Color.fromARGB(150, 0, 0, 0),
            child: FractionallySizedBox(
              // Sets size of the modal
              widthFactor: 0.8,
              heightFactor: 0.7,
              child: Center(
                child: Container(
                  // Sets color of the modal
                  color: Colors.blue.shade50,
                  child: Column(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 2, 2, 2)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () => hideOverlay(),
                        child: setText('x'),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8),
                        child: widget.content,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context)?.insert(overlayEntry);
  }

  // builds empty container at launch
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.showModal ? showOverlay() : () {};
    });
    print('time delay ${widget.timeDelay}, showModal ${widget.showModal}');
    return Container();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.timeDelay
          ? Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                widget.showModal = true;
              });
            })
          : () {};
    });
  }
}
