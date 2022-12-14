import 'package:flutter/material.dart';
import 'helper.dart';

class StepsLeft extends StatefulWidget {
  StepsLeft({
    super.key,
    required this.allSteps,
    required this.currentStep,
    this.color = Colors.green,
  })  : assert(allSteps.isNotEmpty, "Empty: No step content is specified."),
        assert(currentStep < allSteps.length, "CurrentStep is out of range.");

  final List<StepClass> allSteps;
  final Color color;
  final int currentStep;

  @override
  State<StepsLeft> createState() => _StepsLeftState();
}

class _StepsLeftState extends State<StepsLeft> {
  @override
  Widget build(BuildContext context) {
    StepClass currentStep = widget.allSteps[widget.currentStep];

    return Container(
      color: const Color.fromARGB(255, 209, 222, 245),
      child: Center(
        child: Column(
          children: [
            currentStep.content,
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Container(
                      height: 2,
                      width: 200,
                      decoration: BoxDecoration(
                        color: widget.color,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < widget.allSteps.length; ++i)
                          StepItem(
                            // create the circle and label item
                            index: i,
                            currentStep: widget.currentStep,
                            label: widget.allSteps[i].label,
                            color: widget.color,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
