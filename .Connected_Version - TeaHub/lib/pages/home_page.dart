import 'package:TeaHub/components/signin_button.dart';
import 'package:TeaHub/home_page/utils.dart';
import 'package:TeaHub/theme/theme_button.dart';
import 'package:TeaHub/theme/theme_provider.dart';
import 'package:TeaHub/weather_widget/weather_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
      //------------------------ Drawer UI ------------------------//

      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 203, 128),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align children to the start (left)
                children: [
                  SizedBox(width: 10), // Left margin
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'TeaHub',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(
                          height: 5), // Vertical spacing between text and icon
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Make the container circular
                          border: Border.all(
                            color: Colors.black, // Set border color
                            width: 2.0, // Set border width
                          ),
                        ),
                        padding: EdgeInsets.all(
                            4.0), // Add padding inside the circle
                        child: Icon(
                          Icons.person,
                          color: Colors.black, // Set icon color
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5), // Add bottom padding of 20 pixels
                        child: Text(
                          'User Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5), // Add bottom padding of 20 pixels
                        child: Text(
                          '${user.email!}',
                          style: TextStyle(
                            fontSize: 16,
                            //color: Colors.black,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(8.0), // Add padding here
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.primary, // Set border color
                  width: 0.5, // Set border width
                ),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.color_lens_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Theme",
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Set text color
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ThemeSelector(),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                signUserOut();
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(8.0), // Add padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Set border color
                    width: 0.5, // Set border width
                  ),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: SizedBox(
                  width: 120,
                  height: 36,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align items to the left
                      children: [
                        Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Close the app
                SystemNavigator.pop();
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(8.0), // Add padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Set border color
                    width: 0.5, // Set border width
                  ),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: SizedBox(
                  width: 120,
                  height: 36,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align items to the left
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Exit',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      //------------------------ Main page UI ------------------------//

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            const SizedBox(height: 15),
            Padding(
              padding:
                  EdgeInsets.only(left: 15), // Add bottom padding of 5 pixels
              child: Text(
                'Hi User,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15), // Add bottom padding of 5 pixels
              child: Text(
                'Welcome to Teahub',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Color(0xFF737373),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15), // Add bottom padding of 20 pixels
              child: Text(
                '${user.email!}',
                style: TextStyle(
                  fontSize: 20,
                  //color: Colors.black,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 15), // Adjust the left padding as needed
            //   child: GestureDetector(
            //     onTap: signUserOut,
            //     child: SizedBox(
            //       width: 120, // Set the desired width here
            //       height: 40,
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: const Color.fromARGB(
            //               255, 78, 203, 128), // Set the desired color here
            //           borderRadius:
            //               BorderRadius.circular(10), // Add 10px border radius
            //         ),
            //         child: Center(
            //           child: Row(
            //             mainAxisAlignment:
            //                 MainAxisAlignment.center, // Align row to center
            //             children: [
            //               const SizedBox(width: 9),
            //               Text(
            //                 'Sign Out',
            //                 style: TextStyle(
            //                   fontSize: 15,
            //                   //color: Colors.black, // Text color
            //                   color: Theme.of(context).colorScheme.primary,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               const SizedBox(width: 3),
            //               IconButton(
            //                 onPressed: signUserOut,
            //                 icon: Icon(
            //                   Icons.logout,
            //                   size: 25,
            //                   //color: Colors.black, // Icon color
            //                   color: Theme.of(context).colorScheme.primary,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Row(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 15.0),
            //       child: Text(
            //         "Theme",
            //         style: TextStyle(
            //           color: Theme.of(context)
            //               .colorScheme
            //               .primary, // Set text color
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     const Padding(
            //       padding: EdgeInsets.only(left: 10.0),
            //       child: ThemeSelector(),
            //     ),
            //   ],
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            //   child: ThemeSelector(),
            // ),

            const SizedBox(height: 370),
            WeatherPage(),
          ],
        ),
      ),
      //),
    );
  }
}
