import 'package:flutter/material.dart';
import 'package:random_number_generator_ex/constants/colors.dart';
import 'package:random_number_generator_ex/screens/home.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random number generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primarySwatch,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: foregroundColor),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
