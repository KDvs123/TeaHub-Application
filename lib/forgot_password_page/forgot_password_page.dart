import 'package:TeaHub/disease_description_treatment/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      SendEmailMessage();
    } on FirebaseAuthException catch (e) {
      print(
          '------------------- Forgot Email Error : ${(e)} -------------------');

      if (e.code == 'The email address is badly formatted') {
        EmailFormatErrorMessage();
      } else if (e.code == 'Unable to establish connection on channel') {
        EmptyEmailErrorMessage();
      } else {
        NoEmailErrorMessage();
      }
    }
  }

  void SendEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: Container(
            width: 300, // Adjust width as needed
            height: 250, // Adjust height as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Password Reset',
                  textAlign: TextAlign.center, // Align text to the center
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                const Icon(
                  Icons.check_circle_sharp, // Replace with the appropriate icon
                  color: Color.fromARGB(255, 78, 203, 128),
                  size: 80,
                ),
                SizedBox(height: 10), // Adjust the height for spacing
                Text.rich(
                  TextSpan(
                    text: "An email has been sent to ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    children: [
                      TextSpan(
                        text: _emailController.text.trim(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " email address with a password reset link.",
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Align text to the center
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: 200, // Adjust width as needed
                height: 40, // Adjust height as needed

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5), // Adjust border radius for roundness
                  color: Colors.blue, // Set button background color
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pop(context); // closing the forgot password page
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white, // Set text color
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void EmailFormatErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid Email',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Invalid Email Format. Please enter a valid email address.",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void EmptyEmailErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Email Required',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Please enter your email address to reset your password.",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void NoEmailErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid Email',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Please ensure you have chosen the correct email address.",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(top: 10.0), // Add padding here
                child: Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/forgot_password/forgot_password.png',
                height: 240,
                width: 250,
              ),
              const SizedBox(height: 30), // Keeping the same size
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Enter the Email address associated\nwith your account and we\'ll send\nyou a link to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 62,
                  width: 300,
                  child: MaterialButton(
                    onPressed: passwordReset,
                    color: const Color.fromARGB(255, 78, 203, 128),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5.0), // Adjust the radius as needed
                    ),
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
