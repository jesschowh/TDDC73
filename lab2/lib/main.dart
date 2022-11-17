import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lab2"),
        ),
        body: const CardForm(),
      ),
    );
  }
}

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final List<String> months = <String>[
    for (var i = 1; i <= 12; i++) i.toString().padLeft(2, '0')
  ];
  final List<String> days = <String>[
    for (var i = 1; i <= 31; i++) i.toString().padLeft(2, '0')
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/1.jpeg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Card Number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Card Holders",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Expiration Date",
                    border: InputBorder.none,
                  ),
                  child: Row(
                    children: <Widget>[
                      Dropdown(
                        drowDownList: months,
                        textHint: "Month",
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Dropdown(
                        drowDownList: days,
                        textHint: "Days",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              const SizedBox(
                width: 120,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "CVV",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  Dropdown({super.key, required this.drowDownList, required this.textHint});

  final List<String> drowDownList;
  final String textHint;
  String? selectedValue;

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(widget.textHint),
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      value: widget.selectedValue,
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.selectedValue = value!;
        });
      },
      items: widget.drowDownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      menuMaxHeight: 400,
    );
  }
}