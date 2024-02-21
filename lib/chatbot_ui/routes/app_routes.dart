import 'package:flutter/material.dart';
import '../presentation/chatbot_screen/chatbot_screen.dart';

class AppRoutes {
  static const String chatbotScreen = '/chatbot_screen';

  static Map<String, WidgetBuilder> routes = {
    chatbotScreen: (context) => ChatbotScreen()
  };
}
