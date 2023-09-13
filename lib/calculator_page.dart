import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String textDisplay = '';
  String subtextDisplay = '';

  double no1 = 0.0, no2 = 0.0, result = 0.0;
  String op = '';

  void onClick(String button) {
    if (button == "AC") {
      clear();
    } else if (button == "C") {
      textDisplay = textDisplay.substring(0, textDisplay.length - 1);
    } else if (button == '=') {
      evaluate();
    } else {
      textDisplay = textDisplay + button;
    }

    setState(() {});
  }

  void clear() {
    textDisplay = '';
    subtextDisplay = '';
    no1 = 0.0;
    no2 = 0.0;
    op = '';
    result = 0.0;
  }

  void evaluate() {
    String temp1 = '';
    bool operatorAvailable = false;

    for (int i = 0; i < textDisplay.length; i++) {
      String temp2 = '';
      temp2 = textDisplay[i];
      if (temp2 == '+' ||
          temp2 == '-' ||
          temp2 == 'x' ||
          temp2 == '÷' ||
          temp2 == '%') {
        op = temp2;
        operatorAvailable = true;
        no1 = double.parse(temp1);
        temp1 = '';
      } else {
        temp1 = temp1 + temp2;
      }
    }

    no2 = double.parse(temp1);

    if (operatorAvailable) {
      if (op == '+') {
        result = no1 + no2;
      } else if (op == '-') {
        result = no1 - no2;
      } else if (op == 'x') {
        result = no1 * no2;
      } else if (op == '%') {
        result = (no1 / 100) * no2;
      } else {
        result = (no1 / no2);
      }

      subtextDisplay = textDisplay;
      textDisplay = result.toStringAsFixed(5);
      textDisplay = removeTrailingZero(textDisplay);
    }
  }

  String removeTrailingZero(String string) {
    if (!string.contains('.')) {
      return string;
    }
    string = string.replaceAll(RegExp(r'0*$'), '');
    if (string.endsWith('.')) {
      string = string.substring(0, string.length - 1);
    }
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
              child: Text(
                subtextDisplay,
                style: TextStyle(
                    fontFamily: GoogleFonts.rubik().fontFamily,
                    color: Colors.black54,
                    fontSize: 30),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Text(
                textDisplay,
                style: TextStyle(
                    fontFamily: GoogleFonts.rubik().fontFamily,
                    color: Colors.black,
                    fontSize: 50),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                buttonText: 'AC',
                buttonColor: Colors.red,
                textColor: Colors.white,
                callback: onClick,
              ),
              CalculatorButton(
                  buttonText: 'C',
                  buttonColor: Colors.green,
                  textColor: Colors.white,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '%',
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '÷',
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  callback: onClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonText: '7',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '8',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '9',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: 'x',
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  callback: onClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonText: '4',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '5',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '6',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '-',
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  callback: onClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonText: '1',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '2',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '3',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '+',
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                  callback: onClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonText: '0',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '00',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '.',
                  buttonColor: Colors.white,
                  textColor: Colors.deepPurple,
                  callback: onClick),
              CalculatorButton(
                  buttonText: '=',
                  buttonColor: Colors.deepPurple[700],
                  textColor: Colors.white,
                  callback: onClick),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
