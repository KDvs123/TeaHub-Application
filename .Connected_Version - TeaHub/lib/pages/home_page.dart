import 'package:TeaHub/TeaDescriptionPage/main.dart';
import 'package:TeaHub/chatbot_ui_updated/ChatScreen.dart';
import 'package:TeaHub/home_page/scanPage.dart';
import 'package:TeaHub/theme/theme_button.dart';
import 'package:TeaHub/weather_widget/weather_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class TopEllipsePainter extends CustomPainter {
  final Color color;

  TopEllipsePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw the ellipse
    var path = Path()
      ..addOval(Rect.fromLTWH(-50, -100, size.width + 100, 311));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


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

  Widget _buildIconTextButton(BuildContext context, IconData icon, String label, Color backgroundColor, Color iconAndTextColor,VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: iconAndTextColor, backgroundColor: backgroundColor, // Foreground (text/icon) color
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 8), // Spacing between icon and text
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //------------------------ Drawer UI ------------------------//
      drawerEnableOpenDragGesture: false, // Prevent user sliding open

      appBar: AppBar(
        backgroundColor:  Color(0xFF4ecb81),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 250),
                  painter: TopEllipsePainter(Color(0xFF4ecb81)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hi Vihanga,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome to TeaHub',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                _buildIconTextButton(
                  context,
                  Icons.camera_alt,
                  'Identify',
                  Color(0xFF4ecb81), // Background color for "Identify"
                  Colors.white, // Icon and text color for "Identify"
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanPage()),
                    );
                  },
                ),
                // The "Assist" button has the new colors
                _buildIconTextButton(
                  context,
                  Icons.message,
                  'Assist',
                  Color(0xFFDDB892), // Creamy brown background color
                  Color(0xFF000000), // Icon and text color
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
                // The "Educate" button also has the new colors
                _buildIconTextButton(
                  context,
                  Icons.school,
                  'Educate',
                  Color(0xFFDDB892), // Creamy brown background color
                  Color(0xFF000000), // Icon and text color
                      () {
                    // Navigator.push logic for 'Educate' button
                  },
                ),
              ],
            ),


            SizedBox(height: 40),
            priceWidget(),
            SizedBox(height: 40),
            WeatherPage(),
          ],
        ),
      ),
      
    );
  }
}
