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
  int currentStep = 0;
  bool showModal = false;

  @override
  Widget build(BuildContext context) {
    List<StepClass> allSteps = <StepClass>[
      StepClass(
        label: 'Lab 1',
        content: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('images/5.jpeg')),
                  setText(
                      'Recreate the credit card layout and interaction functionality for Android'),
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
                  setText('Create an app that communicates with Github'),
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
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  setText('Create mini SDK of interaction patterns'),
                  setText('Framework: Flutter, API: GraphQL'),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
    List<StepClass> allStepsEMPTY = <StepClass>[];

    // bool getBool() {
    //   Future.delayed(const Duration(milliseconds: 500), () {
    //     showModal = true;
    //   });
    //   return showModal;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project: StepsLeft and Modal demo"),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          children: [
            const SizedBox(
                child: Text(
                    'Lorem Ipsum är bäs orem Ipsum är helt enkelt dummy text från tryckeri- och sättningsindustrin. Lorem Ipsum har varit branschens vanliga dummytext ända sedan 1500-talet, då en okänd skrivare tog ett pentry av typ och förvrängde det för att göra en typprovbok. Den har överlevt inte bara fem århundraden, utan också språnget till elektronisk sättning, förblir i stort sett oförändrad. Det blev populärt på 1960-talet med lanseringen av Letraset-ark som innehöll Lorem Ipsum-passager, och mer nyligen med programvara för desktop publishing som Aldus PageMaker inklusive versioner av Lorem Ipsum.tkkkkkk kkkkk kkkkkkkkk kkkkkkk kkkkkkk kkkkkk kkkk kkkk kkkkkkk kkkkkkk kkkkkkkkk kkkkkkkk kkkkkkkkk kkkkkkkk kkkkkkkk kkkkk  kkkkk kkkkkkkkk kkkkkkkkkkkkkkkk')),
            Modal(
              content: StepsLeft(
                  allSteps: allSteps,
                  currentStep: currentStep,
                  color: Colors.pink),
              showModal: showModal,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 2, 2)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  currentStep = currentStep + 1;
                  if (currentStep > allSteps.length) currentStep = 0;
                  showModal = true;
                });
              },
              child: const Text('Show Next Step'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 15), () {
  //     setState(() {
  //       showModal = true;
  //     });
  //   });
  // }
}
