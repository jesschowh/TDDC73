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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            //mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              currentStep.content,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: Container(
                        height: 2,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          color: widget.color,
                        ),
                      ),
                    ),
                    Row(
                      //mainAxisSize: MainAxisSize.max,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < widget.allSteps.length; ++i)
                          StepItem(
                            index: i,
                            length: widget.allSteps.length,
                            currentStep: widget.currentStep,
                            label: widget.allSteps[i].label,
                            color: widget.color,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
