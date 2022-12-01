import 'package:flutter/material.dart';
import 'helper.dart';

class StepsLeft extends StatefulWidget {
  const StepsLeft({super.key, required this.allSteps});

  final List<StepClass> allSteps;
  @override
  State<StepsLeft> createState() => _StepsLeftState();
}

class _StepsLeftState extends State<StepsLeft> {
  @override
  Widget build(BuildContext context) {
    StepClass currentStep = widget.allSteps[0];

    return FloatContainer(
      content: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(currentStep.title),
              ),
            ],
          ),
          Row(
            children: [
              for (var item in widget.allSteps)
                Text(
                  item.label,
                  style: const TextStyle(fontSize: 12),
                ),
            ],
          ),
          currentStep.content,
        ],
      ),
    );
  }
}
