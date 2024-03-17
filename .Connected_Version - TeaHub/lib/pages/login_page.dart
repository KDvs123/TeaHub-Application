import 'package:TeaHub/components/login_button.dart';
import 'package:TeaHub/components/my_textfield.dart';
import 'package:TeaHub/components/square_tile.dart';
import 'package:TeaHub/pages/splash_screens.dart';
import 'package:TeaHub/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:teahub/components/login_button.dart';
// import 'package:teahub/components/my_textfield.dart';
// import 'package:teahub/components/square_tile.dart';
// import 'package:teahub/pages/splash_screens.dart';
// import 'package:teahub/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //User login
  void UserLogin() async {
    //Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 78, 203, 128)),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //Display exception in terminal
      print("Exception code : ${e.code}");
      //pop the loading circle
      Navigator.pop(context);
      //invalid user
      if (e.code == 'invalid-credential') {
        //Display error to user
        invalidUserMessage();
      } else if (e.code == 'invalid-email') {
        //Display error to user
        invalidEmailMessage();
      } else if (e.code == 'channel-error') {
        //Display error to user
        emptyUserMessage();
      }
    }
  }

  // Error message - Display an error message if the user input is empty
  void emptyUserMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid credentials',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Please enter your email and password.',
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

  // Email error message - Display error message if the user's email is invalid
  void invalidEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid email',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'The provided email is invalid. Please check your email.',
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

  // Invalid user message - Display error message if the user credentials are invalid
  void invalidUserMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid User',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'The provided credentials are invalid. Please check your email and password.',
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

  // ------------- Log in page UI -------------- //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => splashScreens()));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Login text
                Text(
                  'Log In',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Enter your Email and Password',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'and start creating',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),

                const SizedBox(height: 30),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                //Login button
                LoginButton(
                  onTap: UserLogin,
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        ' Or Login with ',
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                //Facebook, Google and Apple icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithFacebook(context),
                      imagePath: 'lib/images/Facebook_icon.png',
                    ),
                    const SizedBox(width: 15),
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/Google_icon.png',
                    ),
                    const SizedBox(width: 15),
                    SquareTile(
                      onTap: () => {},
                      imagePath: 'lib/images/Apple_icon.png',
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
