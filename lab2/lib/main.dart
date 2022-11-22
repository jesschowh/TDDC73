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
  final List<String> year = <String>[
    for (var i = 2022; i <= 2035; i++) i.toString().padLeft(2, '0')
  ];

  String cardSampleString = "XXXX XXXX XXXX XXXX";
  String cardHolder = "Firstname Lastname";
  String cardNumber = "XXXX XXXX XXXX XXXX";
  String cardMonth = "MM";
  String cardYear = "YY";
  var carCVV;
  var cardType;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 40),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                number: cardNumber,
                holder: cardHolder,
                expireYear: cardYear,
                expireMonth: cardMonth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Card Number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  CardInputFormatter(sample: cardSampleString, separator: " "),
                ],
                onChanged: ((value) {
                  setState(() {
                    cardNumber =
                        value + cardSampleString.substring(value.length);
                  });
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Card Holders",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: ((value) {
                  setState(() {
                    cardHolder = value;
                  });
                }),
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
                          callback: (value) {
                            setState(() {
                              cardMonth = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Dropdown(
                          drowDownList: year,
                          textHint: "Year",
                          callback: (value) {
                            setState(() {
                              cardYear = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "CVV",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Text getCardText(input) {
  return Text(
    input,
    style: const TextStyle(color: Colors.deepPurpleAccent),
  );
}

String getCardType(input) {
  String res;

  if (RegExp('^4').hasMatch(input)) {
    res = 'visa';
  } else if (RegExp("^(34|37)").hasMatch(input)) {
    res = 'amex';
  } else if (RegExp("^5[1-5]").hasMatch(input)) {
    res = 'mastercard';
  } else if (RegExp("^6011").hasMatch(input)) {
    res = 'discover';
  } else if (RegExp("^9792").hasMatch(input)) {
    res = 'troy';
  } else {
    res = 'jcb';
  }

  // if (input) int firstDigit;
  // String res = '';
  // int secondDigit = 4;
  // int fourDigits = 4444;
  // if (input.length > 0) {
  //   firstDigit = int.parse(input[0]);

  //   // int
  //   // int secondDigit = int.parse(input[1]);
  //   // int fourDigits = int.parse(input.substring(0, 4));

  //   // if (input.length > 4) {

  //   // }

  //   switch (firstDigit) {
  //     case 4:
  //       res = 'visa';
  //       break;
  //     case 5:
  //       {
  //         if (secondDigit >= 1 && secondDigit <= 5) {
  //           res = 'mastercard';
  //         }
  //       }
  //       break;
  //     case 3:
  //       {
  //         if (secondDigit == 4 || secondDigit == 7) {
  //           res = 'amex';
  //         } else if (secondDigit == 0 || secondDigit == 6 || secondDigit == 8) {
  //           res = 'dinersclub';
  //         } else if (fourDigits >= 3528 && fourDigits <= 3589) {
  //           res = 'jcb';
  //         }
  //       }
  //       break;
  //     case 6:
  //       {
  //         if (fourDigits == 6011) {
  //           res = 'discover';
  //         } else if (secondDigit == 2) {
  //           res = 'unionpay';
  //         }
  //       }
  //       break;
  //     case 9:
  //       {
  //         if (fourDigits == 9792) {
  //           res = 'troy';
  //         }
  //       }
  //       break;
  //     default:
  //       res = 'visa';
  //       break;
  //   }
  // }
  return 'images/$res.png';
}

// ignore: must_be_immutable
class Card extends StatefulWidget {
  Card(
      {super.key,
      required this.number,
      required this.holder,
      required this.expireMonth,
      required this.expireYear});
  String number;
  String holder;
  String expireMonth;
  String expireYear;
  var imgRatio = 675 / 435;
  @override
  State<StatefulWidget> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: const DecorationImage(
            image: AssetImage('images/19.jpeg'),
            fit: BoxFit.cover,
          )),
      child: SizedBox(
        width: 250 * widget.imgRatio,
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //chip and card type
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.asset('images/chip.png'),
                  ),
                  SizedBox(
                    height: 50,
                    // child: Image.asset('images/mastercard.png'),
                    child: Image.asset(getCardType(widget.number)),
                  ),
                ],
              ),
              // card number
              Text(widget.number),
              // card holder and expiry date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      const Text("Card Holder"),
                      getCardText(widget.holder),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Expires"),
                      Text("${widget.expireMonth}/${widget.expireYear}"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Dropdown extends StatefulWidget {
  Dropdown(
      {super.key,
      required this.drowDownList,
      required this.textHint,
      required this.callback});

  final List<String> drowDownList;
  final String textHint;
  Function callback;
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
        widget.callback(value);
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

class CardInputFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CardInputFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty &&
        newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > sample.length) return oldValue;

      var truncatedText = newValue.text.replaceAll(RegExp(r'(\d)|(\s)'), '');
      //Remove unwanted characters
      if (truncatedText.length > 0) return oldValue;

      //Is it time for a new separator?
      if (newValue.text.length < sample.length &&
          sample[newValue.text.length - 1] == separator) {
        return TextEditingValue(
          text:
              '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    }
    return newValue;
  }
}
