import 'package:TeaHub/disease_description/diseases.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Fixing the key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disease Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Disease(), // Using the Disease widget as the home screen
    );
  }
}
