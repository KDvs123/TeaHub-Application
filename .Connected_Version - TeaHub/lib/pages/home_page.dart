import 'package:TeaHub/chatbot_ui_updated/ChatScreen.dart';
import 'package:TeaHub/theme/theme_button.dart';
import 'package:TeaHub/weather_widget/weather_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  // //Document IDs
  // List<String> docIDs = [];

  // //Get docIDs
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection('Users')
  //       .get()
  //       .then((snapshot) => null);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //------------------------ Drawer UI ------------------------//
      drawerEnableOpenDragGesture: false, // Prevent user sliding open

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Home',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
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
                      // Vertical spacing between text and icon
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  'assets/images/user_profile/rectangle-6.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 158),
                            GestureDetector(
                              onTap: () {
                                // Close the drawer
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.all(0), // Set all margins to 0
                                padding: EdgeInsets.only(
                                    top: 0), // Set top padding to 0
                                child: Icon(
                                  Icons.arrow_left,
                                  color: Colors.black,
                                  size: 50,
                                ),
                              ),
                            ),
                          ],
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
            // StreamBuilder<QuerySnapshot>(
            //     stream:
            //         FirebaseFirestore.instance.collection('Users').snapshots(),
            //     builder: (context, snapshot) {
            //       List<Row> usersWidgets = [];
            //       if (snapshot.hasData) {
            //         final users = snapshot.data?.docs.reversed.toList();
            //         for (var user in users!) {
            //           final usersWidget = Row(
            //             children: [
            //               Text(user['user name']),
            //             ],
            //           );
            //           usersWidgets.add(usersWidget);
            //         }
            //       }
            //       return Expanded(
            //         child: ListView(
            //           children: usersWidgets,
            //         ),
            //       );
            //     }),
            // StreamBuilder<QuerySnapshot>(
            //   stream:
            //       FirebaseFirestore.instance.collection('Users').snapshots(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //     if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     }
            //     final users = snapshot.data?.docs.reversed.toList();
            //     return ListView.builder(
            //       itemCount: users?.length,
            //       itemBuilder: (context, index) {
            //         final userData = users?[index].data()
            //             as Map<String, dynamic>; // Explicit cast
            //         return ListTile(
            //           title: Text(userData['user name'] ?? ''),
            //           // You can add more widgets here to display additional user data
            //         );
            //       },
            //     );
            //   },
            // ),
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
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 78, 203, 128),
                    backgroundColor: Color.fromARGB(255, 78, 203, 128),
                    elevation: 15,
                    shadowColor: Colors.black,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt, // Add your desired icon here
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between icon and text as needed
                      Text(
                        'Identify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10), // 10 px space between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(
                        255, 78, 203, 128), //Colors.tealAccent.shade700,
                    backgroundColor: Theme.of(context).colorScheme.surfaceTint,
                    elevation: 15, // Elevation
                    shadowColor: Colors.black, // Shadow Color
                    fixedSize: Size(100, 100), // Define height and width here
                    //backgroundColor: Colors.blue, // Set the desired color here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Set border radius to 10 pixels
                      side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Set border color here
                        width: 0.5, // Set border width here
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.adb, //reddit, // Add your desired icon here
                        color: Color.fromARGB(255, 78, 203, 128),
                        size: 40,
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between icon and text as needed
                      Text(
                        'Assist',
                        style: TextStyle(
                          color: Color.fromARGB(255, 78, 203, 128),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10), // 10 px space between buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(
                        255, 78, 203, 128), //Colors.tealAccent.shade700,
                    backgroundColor: Theme.of(context).colorScheme.surfaceTint,
                    elevation: 15, // Elevation
                    shadowColor: Colors.black, // Shadow Color
                    fixedSize: Size(100, 100), // Define height and width here
                    //backgroundColor: Colors.blue, // Set the desired color here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Set border radius to 10 pixels
                      side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Set border color here
                        width: 0.5, // Set border width here
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book, // Add your desired icon here
                        color: Color.fromARGB(255, 78, 203, 128),
                        size: 40,
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between icon and text as needed
                      Text(
                        'Educate',
                        style: TextStyle(
                          color: Color.fromARGB(255, 78, 203, 128),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 240),
            WeatherPage(),
          ],
        ),
      ),
      //),
    );
  }
}
