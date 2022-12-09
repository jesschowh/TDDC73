// Class to build the widget and what step it belong to ?? will elaborate later
import 'package:flutter/material.dart';

class StepClass {
  String title;
  String label;
  Widget content;

  StepClass({required this.title, required this.label, required this.content});
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
      required this.length,
      required this.currentStep,
      required this.label,
      required this.color});

  final int index;
  final int length;
  final int currentStep;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            circle(index, currentStep, color),
            index < length - 1
                ? Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
