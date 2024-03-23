import 'package:flutter/material.dart';
import 'package:TeaHub/disease_description_treatment/home_screen.dart';
import 'package:TeaHub/disease_description_treatment/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _dragExtent = 0.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.whiteClr,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text(
              "The disease is",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Text(
              "Brown Blight Disease",
              style: TextStyle(
                fontSize: 34, // Increased font size
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xFF4ECB81),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF4ECB81), width: 4), 
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/disease_description_and_treatment_imgs/welcome.jpg",
                  fit: BoxFit.cover,
                  width: 300, 
                  height: 300, 
                ),
              ),
            ),
            SizedBox(height: 50), 
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragExtent += details.primaryDelta ?? 0;
                  _dragExtent = _dragExtent.clamp(0.0, MediaQuery.of(context).size.width - 240.0);
                });
              },
              onHorizontalDragEnd: (details) {
                if (_dragExtent >= MediaQuery.of(context).size.width - 240.0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }
                setState(() {
                  _dragExtent = 0.0;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF4ECB81).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Slide to Continue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Positioned(
                      left: _dragExtent,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}