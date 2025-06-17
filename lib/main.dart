import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculation());
}

class BmiCalculation extends StatelessWidget {
  const BmiCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
} 