import 'package:flutter/material.dart';

class screen_1 extends StatelessWidget {
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
                'lib/images/screen_1.png', // path to image
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
                child: const Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Predict Diseases Instantly\nwith a Snap!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '"Snap a pic, diagnose quick! Our app predicts\nplant diseases with Al precision, empowering\ngrowers for healthier yields!"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
