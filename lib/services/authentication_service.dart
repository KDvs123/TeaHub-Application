import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  //Google Sign in
  signInWithGoogle() async {
    //begin interactive sign in precess
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create a new credentials for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //finally,lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCridential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      //await .signInWithCredential(facebookAuthCridential);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCridential);
    } on FirebaseAuthException catch (e) {
      //print("Error during Facebook login: $e");
      showSnackBar(context, e.message!);
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
