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
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> months = <String>[
    for (var i = 1; i <= 12; i++) i.toString().padLeft(2, '0')
  ];
  final List<String> year = <String>[
    for (var i = 2022; i <= 2035; i++) i.toString().padLeft(2, '0')
  ];

  final String amexCardMask = "#### ###### #####";
  final String otherCardMask = "#### #### #### ####";

  String cardHolder = "Full Name";
  String cardNumber = "#### #### #### ####";
  String cardMonth = "MM";
  String cardYear = "YY";
  String cardMask = "#### #### #### ####";
  String cardType = "visa";
  String cardCVV = "";

  bool showCardBack = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 40),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //---- Card ----
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                number: cardNumber,
                holder: cardHolder,
                expireYear: cardYear,
                expireMonth: cardMonth,
                type: cardType,
                flipped: showCardBack,
                cvv: cardCVV,
              ),
            ),

            // ------- FORM --------
            // ---- Card Number -----
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
                  CardInputFormatter(sample: cardMask, separator: " "),
                ],
                onChanged: ((value) {
                  setState(() {
                    cardType = getCardType(value);
                    cardMask =
                        cardType == "amex" ? amexCardMask : otherCardMask;
                    cardNumber = value + cardMask.substring(value.length);
                  });
                }),
              ),
            ),

            // ---- Card Holder -----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Card Holder",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(30),
                ],
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
                // ---- Expiration date -----
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
                          textHint: cardMonth == "MM" ? "Month" : cardMonth,
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
                          textHint: cardYear == "YY" ? "Year" : cardYear,
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

                // ---- CVV -----
                SizedBox(
                  width: 120,
                  child: FocusScope(
                    child: Focus(
                      onFocusChange: (focus) {
                        setState(() {
                          showCardBack = focus;
                        });
                      },
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "CVV",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        onChanged: ((value) {
                          setState(() {
                            cardCVV = value;
                          });
                        }),
                      ),
                    ),
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

Text getCardNumberText(input) {
  return Text(
    input,
    style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        shadows: [textShadow()]),
  );
}

Text getCardText(input) {
  return Text(
    input,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      shadows: [textShadow()],
    ),
  );
}

Shadow textShadow() {
  return Shadow(
    offset: const Offset(2.0, 2.0), //position of shadow
    blurRadius: 6.0, //blur intensity of shadow
    color: Colors.black.withOpacity(0.8), //color of shadow with opacity
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
  } else if (RegExp("^30[0-5]|309|36|38|39").hasMatch(input)) {
    res = 'dinersclub';
  } else if (RegExp("^35[28-89]").hasMatch(input)) {
    res = 'jcb';
  } else if (RegExp("^62").hasMatch(input)) {
    res = 'unionpay';
  } else {
    res = 'visa';
  }

  return res;
}

// ignore: must_be_immutable
class Card extends StatefulWidget {
  Card(
      {super.key,
      required this.number,
      required this.holder,
      required this.expireMonth,
      required this.expireYear,
      required this.type,
      required this.flipped,
      required this.cvv});
  String number;
  String holder;
  String expireMonth;
  String expireYear;
  String type;
  String cvv;
  bool flipped;

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
        child: widget.flipped
            ?
            // ---- Back Side of Card -----
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: DecoratedBox(
                        decoration:
                            BoxDecoration(color: Color.fromARGB(195, 0, 0, 0))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text('CVV'),
                        SizedBox(
                          width: double.maxFinite,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(195, 227, 227, 227)),
                            child: Text(
                              widget.cvv,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Image.asset('images/${widget.type}.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            :

            // ---- Front Side of Card -----
            Padding(
                padding: const EdgeInsets.all(12.0),
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
                          child: Image.asset('images/${widget.type}.png'),
                        ),
                      ],
                    ),
                    getCardNumberText(widget.number),
                    // card holder and expiry date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Card Holder"),
                            getCardText(widget.holder.toUpperCase()),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Expires"),
                            getCardText(
                                "${widget.expireMonth}/${widget.expireYear}"),
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
  final Function callback;
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
          widget.callback(value);
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
      if (truncatedText.isNotEmpty) return oldValue;

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
