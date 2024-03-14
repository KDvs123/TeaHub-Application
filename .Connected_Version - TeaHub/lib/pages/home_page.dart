import 'package:TeaHub/weather_widget/weather_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15), // Add bottom padding of 5 pixels
              child: Text(
                'Hi User,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15), // Add bottom padding of 5 pixels
              child: Text(
                'Welcome to Teahub',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF737373),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15), // Add bottom padding of 20 pixels
              child: Text(
                '${user.email!}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15), // Adjust the left padding as needed
              child: GestureDetector(
                onTap: signUserOut,
                child: SizedBox(
                  width: 120, // Set the desired width here
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 78, 203, 128), // Set the desired color here
                      borderRadius:
                          BorderRadius.circular(10), // Add 10px border radius
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Align row to center
                        children: [
                          const SizedBox(width: 9),
                          const Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black, // Text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3),
                          IconButton(
                            onPressed: signUserOut,
                            icon: const Icon(
                              Icons.logout,
                              size: 25,
                              color: Colors.black, // Icon color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 330),
            WeatherPage(),
          ],
        ),
      ),
      //),
    );
  }
}
