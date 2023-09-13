import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  String buttonText;
  var buttonColor;
  var textColor;
  var callback;

  CalculatorButton(
      {required this.buttonText,
      this.buttonColor,
      this.textColor,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => callback(buttonText),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            foregroundColor: textColor,
            backgroundColor: buttonColor),
        child: Text(
          buttonText,
          style: TextStyle(
              fontFamily: GoogleFonts.rubik().fontFamily, fontSize: 15),
        ),
      ),
    );
  }
}
