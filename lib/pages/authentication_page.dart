import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teahub/pages/home_page.dart';
//import 'package:teahub/pages/signin_page.dart';
//import 'package:teahub/pages/login_page.dart';
import 'package:teahub/pages/splash_screens.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if (Navigator.of(context).canPop()) {
            //   Navigator.pop(context);
            // }
            if (Navigator.of(context).canPop()) {
              // Use function to close the signin page after a short delay
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            }

            // Return to the home page
            return HomePage();
          } else {
            // Display splash screens
            return const splashScreens();
          }
        },
      ),
    );
  }
}
