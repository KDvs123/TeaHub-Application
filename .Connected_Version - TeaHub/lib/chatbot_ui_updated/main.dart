import './ChatScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const ChatbotScreen());
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeaBot Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: ChatScreen(),
      
    );
  }
}
