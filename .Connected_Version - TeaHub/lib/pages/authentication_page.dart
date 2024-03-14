import 'package:TeaHub/pages/splash_screens.dart';
import 'package:TeaHub/pages/two_step_verification/verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (Navigator.of(context).canPop()) {
              Navigator.pop(context);
            }

            if (Navigator.of(context).canPop()) {
              Navigator.pop(context);
            }

            // Return to the home page
            //return HomePage();

            // Return to the navigation page
            //return TeaProfilePage();

            return VerificationPage();
          } else {
            // Display splash screens
            return splashScreens();

            // Display login or sign in page
            //return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
