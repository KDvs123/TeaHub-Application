import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/treatment_imgs/your_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 312,
            left: 0,
            right: 0,
            child: Container(
              width: 375,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 343,
                    height: 76,
                    margin: EdgeInsets.only(left: 18, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heading',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          'Subheading',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 433,
            left: 11,
            child: Container(
              width: 350,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(0xFFE6FFD6), // #E6FFD6
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 36,
            child: Container(
              width: 134,
              height: 17,
              child: Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  height: 1.5, // Line height equivalent to 21px
                  color: Colors.black, // Assuming text color is black
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 447,
            left: 198,
            child: Container(
              width: 141,
              height: 21,
              child: Text(
                'Treatment',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  height: 1.5, // Line height equivalent to 21px
                  color: Colors.black, // Assuming text color is black
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 512,
            left: 18,
            child: Container(
              width: 273,
              height: 34,
              child: Text(
                'Treatment with Biological Agents',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  height: 1.1875, // Line height equivalent to 19px
                  color: Color(0xFF4ECB81), // #4ECB81
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: 572,
            left: 25,
            child: Container(
              width: 117,
              height: 115,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 3,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                      'images/treatment_imgs/med 1.png'), // Replace 'image.png' with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: 118,
                height: 1,
                margin: EdgeInsets.only(top: 87),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Color(0xFFF0F0F0), // #F0F0F0
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 572,
            left: 222,
            child: Container(
              width: 117,
              height: 115,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
