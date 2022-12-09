import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  const Modal({super.key, required this.content, this.showModal = true});

  final Widget content;
  final bool showModal;

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
          child: Container(
            color: const Color.fromARGB(150, 0, 0, 0),
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.7,
              child: Center(
                child: Container(
                  color: Colors.blue.shade50,
                  child: Column(
                    children: [
                      widget.content,
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 2, 2, 2)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () => hideOverlay(),
                        child: const Text('x'),
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

  // builds empty contaainer at launch
  //how can the user specify when to show modal??
  @override
  Widget build(BuildContext context) {
    print(widget.showModal);
    return Container();
  }

  // Displays the Modal widget after build is finished
  @override
  void initState() {
    super.initState();
    print("running init state");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("running addPostFrameCallback");
      // RendererBinding.instance.addPostFrameCallback((_) {
      widget.showModal ? showOverlay() : () {};
    });
  }
}
