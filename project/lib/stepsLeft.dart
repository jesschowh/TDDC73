import 'package:flutter/material.dart';
import 'helper.dart';

class StepsLeft extends StatefulWidget {
  StepsLeft({
    super.key,
    required this.allSteps,
    required this.currentStep,
    this.showWidget = true,
    this.color = Colors.green,
  })  : assert(allSteps.isNotEmpty, "Empty: No step content is specified."),
        assert(currentStep < allSteps.length, "CurrentStep is out of range.");

  final List<StepClass> allSteps;
  final Color color;
  bool showWidget;

  final int currentStep;

  @override
  State<StepsLeft> createState() => _StepsLeftState();
}

class _StepsLeftState extends State<StepsLeft> {
  @override
  Widget build(BuildContext context) {
    StepClass currentStep = widget.allSteps[widget.currentStep];

    return widget.showWidget
        ? Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            color: const Color.fromARGB(255, 209, 222, 245),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [currentStep.content],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: widget.color,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < widget.allSteps.length; ++i)
                            StepItem(
                                index: i,
                                length: widget.allSteps.length,
                                currentStep: widget.currentStep,
                                label: widget.allSteps[i].label,
                                color: widget.color)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 2, 2, 2)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(widget.color),
                        ),
                        onPressed: () {
                          setState(() {
                            widget.showWidget = false;
                          });
                        },
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
