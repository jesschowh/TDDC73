import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'TDDC73 Lab 1 :)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TDDC73 Lab 1 :)'),
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
                    borderRadius: BorderRadius.circular(100)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Text Color
                      backgroundColor: Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: Text(
                      'BUTTON',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Text Color
                      backgroundColor: Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: Text(
                      'BUTTON',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Text Color
                      backgroundColor: Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: Text(
                      'BUTTON',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Text Color
                      backgroundColor: Color(0xffc7c7c7),
                    ),
                    onPressed: () {},
                    child: Text(
                      'BUTTON',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Email',
                    textAlign: TextAlign.center,
                  ),
                  // text input here, comment out of not working ttyp
                  /*               TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),*/
                ],
              ),
            ],
          ),
        ));
  }
}
