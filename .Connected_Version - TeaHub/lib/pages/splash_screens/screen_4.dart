import 'package:TeaHub/pages/LoginOrSignin_page.dart';

import 'package:flutter/material.dart';
//import 'package:teahub/pages/signin_page.dart';
//import 'package:teahub/pages/login_page.dart';

class screen_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            color: Colors.grey,
            child: Positioned(
              child: Image.asset(
                'lib/images/screen_4.png', // path to image
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft:
                    Radius.circular(25.0), // Set the desired top-left radius
                topRight:
                    Radius.circular(25.0), // Set the desired top-right radius
              ),
              child: Container(
                color: Colors.white,
                height: 410,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Let\'s Create',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Welcome to TeaHub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),

                    //button
                    Positioned(
                      child: TextButton(
                        onPressed: () {
                          //pop the splash screen_4
                          Navigator.pop(context);
                          // Move to the register page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginOrRegisterPage()),
                            // MaterialPageRoute(builder: (context) => AuthPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 78, 203, 128),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Set the radius to 5
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
                          child: const Text(
                            'I\'m New Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //
                    const SizedBox(height: 60),

                    //sign in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have An Account? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //pop the splash screen_4
                            Navigator.pop(context);
                            //send to log in page
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const LoginOrRegisterPage()));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
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
          )
        ],
      ),
    );
  }
}
