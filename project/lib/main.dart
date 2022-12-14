import 'package:flutter/material.dart';
import 'package:project/modal.dart';
import 'stepsLeft.dart';
import 'helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentStep = 2;
  bool showModal = false;
  bool showEmptyModal = false;

  @override
  Widget build(BuildContext context) {
    // Content to place in modal
    List<StepClass> allSteps = <StepClass>[
      StepClass(
        label: 'Lab 1',
        content: Column(
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.assignment,
                    size: 70,
                  ),
                  setText(
                      'Recreate the layout from the example in three frameworks: Android Studio, React Native, and Flutter'),
                ],
              ),
            ),
          ],
        ),
      ),
      StepClass(
        label: 'Lab 2',
        content: Column(
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.credit_card,
                    size: 70,
                  ),
                  setText(
                      'Recreate the credit card layout and interaction functionality for Android'),
                  const SizedBox(height: 20.0),
                  setText('Framework: Flutter'),
                ],
              ),
            ),
          ],
        ),
      ),
      StepClass(
        label: 'Lab 3',
        content: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wifi,
                    size: 70,
                  ),
                  setText('Create an app that communicates with Github'),
                  const SizedBox(height: 20.0),
                  setText('Framework: Flutter, API: GraphQL'),
                ],
              ),
            ),
          ],
        ),
      ),
      StepClass(
        label: 'Project',
        content: Column(
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.engineering,
                    size: 70,
                  ),
                  setText('Create mini SDK of interaction patterns'),
                  const SizedBox(height: 20.0),
                  setText('Chosen patterns: modal and stepsleft'),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project: StepsLeft and Modal demo"),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: setTitleText('TDDC73 Course Content'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '- Architecture for event-based window systems with widgets.\n- Design patterns for interaction programming (eg MVC, Observer, Command, Decorator).\n - Class library for graphical user interfaces.\n - Programming of own widgets for platforms such as android or iOS.\n - Redesign and implementation of graphical user interfaces based on known usability issues. \n - Interaction programming and design principles for graphical user interfaces, e.g. how class libraries can support conventions and interaction paradigms.'),
            ),
            Modal(
              content: StepsLeft(
                  allSteps: allSteps,
                  currentStep: currentStep,
                  color: Colors.pink),
              showModal: showModal,
            ),
            StepsLeft(allSteps: allSteps, currentStep: 0),
            Modal(
              content: Container(
                width: 200,
                height: 200,
                color: Colors.indigo,
                child: setText("Modal"),
              ),
              showModal: showEmptyModal,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 2, 2)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  showModal = true;
                  showEmptyModal = false;
                  currentStep = currentStep + 1;
                  if (currentStep >= allSteps.length) currentStep = 0;
                });
              },
              child: const Text('Show Course Progress'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 2, 2)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 175, 144, 76)),
              ),
              onPressed: () {
                setState(() {
                  showModal = false;
                  showEmptyModal = true;
                });
              },
              child: const Text('Show Modal'),
            ),
          ],
        ),
      ),
    );
  }
}
