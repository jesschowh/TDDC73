import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'TDDC73 Lab 1 :)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TDDC73 Lab 1 :)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  // replace with image later
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://petapixel.com/assets/uploads/2022/07/DALLEcopy.jpg"),
                          fit: BoxFit.cover))),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BUTTON',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BUTTON',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BUTTON',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BUTTON',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Email',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  // text input here, comment out of not working ttyp
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter email here..',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
