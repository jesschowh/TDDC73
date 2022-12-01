// Class to build the widget and what step it belong to ?? will elaborate later
import 'package:flutter/material.dart';

class StepClass {
  String title;
  String label;
  Widget content;

  StepClass({required this.title, required this.label, required this.content});
}

class FloatContainer extends StatefulWidget {
  const FloatContainer({super.key, required this.content});

  final Widget content;

  @override
  State<FloatContainer> createState() => _FloatContainerState();
}

class _FloatContainerState extends State<FloatContainer> {
  late OverlayEntry overlayEntry;

  void showIndicator() {
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return ContainerContent(
          content: widget.content, closeWindow: overlayEntry.remove);
    });
    Overlay.of(context)?.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 50,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Color.fromARGB(255, 2, 2, 2)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: showIndicator,
        child: Text('Click me'),
      ),
    );
  }
}

class ContainerContent extends StatelessWidget {
  const ContainerContent(
      {super.key, required this.content, required this.closeWindow});
  final Widget content;
  final Function closeWindow;

  @override
  Widget build(BuildContext context) {
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
                  content,
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 2, 2, 2)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => closeWindow(),
                    child: Text('Close window'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
