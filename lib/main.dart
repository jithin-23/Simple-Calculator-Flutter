import 'package:flutter/material.dart';
import 'calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: ThemeData(brightness: Brightness.dark),
      home: CalculatorPage(),
    );
  }
}
