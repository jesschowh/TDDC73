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
    //bool showWidget = true;

    StepClass stepTest = StepClass(
        title: 'title1',
        label: 'label1',
        content: SizedBox(
            width: 200,
            height: 200,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('text11'), Text('text12')])));
    StepClass stepTest2 = StepClass(
        title: 'title2',
        label: 'label2',
        content: Row(children: const [
          Text('hello this iiiis a text :))))) '),
          Text('text22')
        ]));
    StepClass stepTest3 = StepClass(
        title: 'title3',
        label: 'label3',
        content: Row(children: const [Text('text31'), Text('text32')]));

    List<StepClass> allSteps = <StepClass>[stepTest, stepTest2, stepTest3];
    List<StepClass> allStepsEMPTY = <StepClass>[];

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
            // StepsLeft(
            //     allSteps: allSteps,
            //     currentStep: currentStep,
            //     color: Colors.pink),

            Modal(
              content: Text("heeeeej detta är en modal ttyp :) "),
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
                  // currentStep = currentStep + 1;
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
}
