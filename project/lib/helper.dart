// Class to build the widget and what step it belong to ?? will elaborate later
import 'package:flutter/material.dart';

class StepClass {
  String label;
  Widget content;

  StepClass({required this.label, required this.content});
}

// Creates circles based on the current step
Container circle(int index, int currentStep, Color color) {
  const Color left = Color.fromARGB(255, 253, 253, 253);
  return Container(
    width: 28,
    height: 28,
    decoration: BoxDecoration(
      color: index <= currentStep ? color : left,
      shape: BoxShape.circle,
      border: Border.all(color: color),
    ),
    child: index < currentStep
        ? const Icon(
            color: Colors.white,
            Icons.done,
          )
        : Container(),
  );
}

// Builds the "steps left" part with circles and label
class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.currentStep,
      required this.label,
      required this.color});

  final int index;
  final int currentStep;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        circle(index, currentStep, color),
        const SizedBox(height: 5),
        setText(label),
      ],
    );
  }
}

Text setText(String input) {
  return Text(
    input,
    textAlign: TextAlign.center,
    style: const TextStyle(
        decoration: TextDecoration.none,
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal),
  );
}

Text setTitleText(String input) {
  return Text(
    input,
    style: const TextStyle(
        decoration: TextDecoration.none,
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold),
  );
}
