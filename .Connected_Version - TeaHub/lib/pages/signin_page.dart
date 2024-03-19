import 'package:TeaHub/components/my_textfield.dart';
import 'package:TeaHub/components/signin_button.dart';
import 'package:TeaHub/components/square_tile.dart';
import 'package:TeaHub/services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        ); // Conter
      },
    );

    //try creating the user
    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        addUserDetails(userNameController.text.trim());

        Navigator.pop(context);
      } else {
        //showErrorMessage("error");
        Navigator.pop(context);
        // show error message, passwords dont't match
        EmailInErrorMessage();
      }

      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("Exception code : ${e.code}");
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      //showErrorMessage(e.code);
      if (e.code == 'invalid-email') {
        Navigator.pop(context);
        invalidEmail();
      } else if (e.code == 'channel-error') {
        channelError();
      } else if (e.code == 'weak-password') {
        weakPasswordError();
      } else if (e.code == 'email-already-in-use') {
        EmailInErrorMessage();
      }
    }
  }

  Future addUserDetails(String userName) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'user name': userName,
    });
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // Email error message - Display when email all ready have an account
  void EmailInErrorMessage() {
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
            'Email Address Already in Use.\nPlease choose a different email\naddress or log in using the\nexisting account.',
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

  // Password error message - Display when user doesn't input the same password twice
  void PasswordErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Invalid Passwords',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Passwords do not match. Please make sure you enter \nthe same password twice \nfor authentication.',
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

  // Password error message - Display when password is less than 6 digits
  void weakPasswordError() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text(
            'Weak password',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Weak password. Please ensure your password is longer than 6 digits for better security.',
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

  // Email error message - Display when input email is invalid
  void invalidEmail() {
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
            'Invalid email address. Please enter a valid email address.',
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

  // Error message - Display an error message if the user input is empty
  void channelError() {
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
            'Please enter both your email address and password to proceed with Signin.',
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            //color: Colors.black,
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
              Text(
                'Sign Up',
                style: TextStyle(
                  //color: Colors.black,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Enter your Email and Password',
                style: TextStyle(
                  //color: Colors.grey,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'and start creating',
                style: TextStyle(
                  //color: Colors.grey,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),
              // email textfield
              MyTextField(
                controller: userNameController,
                hintText: 'User Name',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              // confirm password textfield
              MyTextField(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 20,
              ),

              // sign in button
              MyButton(
                text: "Register",
                onTap: signUserUp,
              ), //MyButton

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        //color: Colors.grey[400],
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Register with',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // google and facebook button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () => AuthService().signInWithFacebook(context),
                    imagePath: 'lib/images/Facebook_icon.png',
                  ),
                  const SizedBox(width: 30),
                  SquareTile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'lib/images/Google_icon.png',
                  ),
                  // const SizedBox(width: 15),
                  // SquareTile(
                  //   onTap: () => {},
                  //   imagePath: 'lib/images/Apple_icon.png',
                  // ),
                ],
              ),

              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
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
                  const SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
