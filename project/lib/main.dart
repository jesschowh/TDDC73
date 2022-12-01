import 'package:flutter/material.dart';
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    StepClass stepTest = StepClass(
        title: 'title1',
        label: 'label1',
        content: Row(children: const [Text('text1'), Text('text2')]));
    StepClass stepTest2 = StepClass(
        title: 'title2',
        label: 'label2',
        content: Row(children: const [Text('text3'), Text('text4')]));

    List<StepClass> allsteps = <StepClass>[stepTest, stepTest2];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project: StepsLeft and Modal demo"),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          children: [
            SizedBox(
                child: Text(
                    'Lorem Ipsum är bäs orem Ipsum är helt enkelt dummy text från tryckeri- och sättningsindustrin. Lorem Ipsum har varit branschens vanliga dummytext ända sedan 1500-talet, då en okänd skrivare tog ett pentry av typ och förvrängde det för att göra en typprovbok. Den har överlevt inte bara fem århundraden, utan också språnget till elektronisk sättning, förblir i stort sett oförändrad. Det blev populärt på 1960-talet med lanseringen av Letraset-ark som innehöll Lorem Ipsum-passager, och mer nyligen med programvara för desktop publishing som Aldus PageMaker inklusive versioner av Lorem Ipsum.tkkkkkk kkkkk kkkkkkkkk kkkkkkk kkkkkkk kkkkkk kkkk kkkk kkkkkkk kkkkkkk kkkkkkkkk kkkkkkkk kkkkkkkkk kkkkkkkk kkkkkkkk kkkkk  kkkkk kkkkkkkkk kkkkkkkkkkkkkkkk')),
            StepsLeft(
              allSteps: allsteps,
            ),
          ],
        ),
      ),
    );
  }
}
