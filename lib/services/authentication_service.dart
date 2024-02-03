import 'dart:async';

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
    // Create a Completer to capture the current context
    final Completer<void> completer = Completer<void>();

    // Execute code synchronously to capture the context
    // This will be executed before entering the async block
    final currentContext = context;

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Use the captured context inside the async block
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      // Complete the Completer to signal that the operation is complete
      completer.complete();
    } on FirebaseAuthException catch (e) {
      // Use the captured context to show the snackbar
      // ignore: use_build_context_synchronously
      showSnackBar(currentContext, e.message!);

      // Complete the Completer with an error to propagate the error
      completer.completeError(e);
    }

    // Return the Future associated with the Completer
    return completer.future;
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
