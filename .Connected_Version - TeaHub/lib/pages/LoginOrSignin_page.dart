import 'package:TeaHub/pages/login_page.dart';
import 'package:TeaHub/pages/signin_page.dart';
import 'package:flutter/material.dart';
//import 'package:teahub/pages/login_page.dart';
//import 'package:teahub/pages/signin_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return RegisterPage(
        onTap: togglePages,
      );
    } else {
      return LoginPage(
        onTap: togglePages,
      );
    }
  }
}
