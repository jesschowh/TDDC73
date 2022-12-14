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
          child: GestureDetector(
            onTap: () => hideOverlay(),
            child: Container(
              // "Smokes" out the background
              color: const Color.fromARGB(150, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: hideOverlay,
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const CircleBorder(),
                          backgroundColor:
                              const Color.fromARGB(154, 255, 255, 255),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 0),
                    child: widget.content,
                  ),
                ],
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
