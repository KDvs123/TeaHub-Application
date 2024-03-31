import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScanUI(),
    );
  }
}

class ScanUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0), // Top padding for 'Join The Community'
          child: Column(
            children: [
              // 'Join The Community' text with proper alignment and padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TeaHub',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Application',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0), // Shift the image up
                      child: Image.asset(
                        'assets/introsplash/tree.png',
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Try the TeaHub\nMagic now!',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Container for bottom text and button with even padding
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 100.0), // Even horizontal padding and spacing at the bottom
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(

                        child: Text(
                          'Turn your Android phone into\n a mobile crop doctor for tea plants.\n Chlorotic diagnosis at your fingertip.',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[500],

                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Handle the start button press
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(0, 18),
                                  blurRadius: 23,
                                ),
                              ],
                              color: Color.fromRGBO(181, 234, 125, 1),
                            ),
                            child: Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white, // Set the text color to white to ensure visibility
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
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
