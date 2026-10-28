import 'package:flutter/material.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/pages/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorTheme.bgBlack
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}