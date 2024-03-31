import 'package:flutter/material.dart';
import 'package:TeaHub/disease_description_treatment/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(
          disease: "Initial Disease"), // Pass the disease parameter here
    );
  }
}
