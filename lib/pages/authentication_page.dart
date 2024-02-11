import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teahub/pages/home_page.dart';
import 'package:teahub/pages/login_page.dart';
//import 'package:teahub/pages/signin_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Navigator.of(context)
            //.push(MaterialPageRoute(builder: (context) => HomePage()));
            return HomePage();
          } else {
            //return SigninPage();
            return const LoginPage();
          }
        },
      ),
    );
  }
}
