import 'dart:async';

import 'package:TeaHub/home_page/navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

//   void sendOTP() async {
//   EmailAuth.sessionName = "sessionOne";
//   var res=await EmailAuth.sendotp
// }

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      print('email ${user.email}');

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 60));
      setState(() => canResendEmail = true);
    } catch (e) {
      print('Send verification email error : $e');
    }
  }

  Future cancelEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      user?.delete();

      // if (Navigator.of(context).canPop()) {
      //   Navigator.pop(context);
      // }
    } catch (e) {
      print('Send verification email error : $e');
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const navigationPage()
      : Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/email_icon.png',
                  width: 180,
                  height: 180,
                ),
                SizedBox(height: 30),
                Text(
                  'Please Verify your Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Verification email has been sent to',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  '${FirebaseAuth.instance.currentUser!.email}', // Displaying user's email
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  'Click on the link to complete the verification process',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  'Wait 60 seconds to get new verification email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 78, 203, 128),
                  ),
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Resend Email',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 78, 203, 128),
                  ),
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  onPressed: cancelEmail,
                ),
              ],
            ),
          ),
        );
}
