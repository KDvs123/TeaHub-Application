import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SuccessScreen(),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/emailverificationui/tick.png',
                width: 300, // Increased image size
                height: 300,
              ),
              SizedBox(height: 24),
              Text(
                'Successfully Login\nto the Account', // Text broken into two lines
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4ECB81), // Green text color
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),
                  children: <TextSpan>[
                    TextSpan(text: 'Verification email has been sent to "sender\'s email". Click on the link to complete the verification process.\n'),
                    TextSpan(
                      text: 'Wait 60 seconds to get new verification email.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add action for Resend Email button
                },
                child: Text('Resend Email', style: TextStyle(
                  color: Color.fromRGBO(246, 237, 237, 1),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                )),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(17, 136, 68, 1),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Add action for Cancel button
                },
                child: Text('Cancel', style: TextStyle(
                  fontSize: 20, // Set font size to 20
                )),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: TextStyle(
                    fontFamily: 'Poppins',
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