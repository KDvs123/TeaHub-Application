import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/your_image.jpg',
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
          // Container 1
          Positioned(
            top: 572,
            left: 25,
            child: Container(
              width: 117,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 4,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),
          ),
          // Image 1
          Positioned(
            top: 572,
            left: 44,
            child: Image.asset(
              'images/med 1.png',
              width: 80,
              height: 81,
            ),
          ),
          // Container 2
          Positioned(
            top: 572,
            left: 222,
            child: Container(
              width: 117,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 4,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),
          ),
          // Image 2
          Positioned(
            top: 572,
            left: 241,
            child: Image.asset(
              'images/med 1.png',
              width: 80,
              height: 81,
            ),
          ),
          // Container with line 1
          Positioned(
            top: 659,
            left: 24,
            child: Container(
              width: 118,
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFF0F0F0),
                  ),
                ),
              ),
            ),
          ),
          // Text below line 1
          Positioned(
            top: 674,
            left: 24,
            child: Text(
              'Medicine 1',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),

          // Container with line 2
          Positioned(
            top: 661,
            left: 222,
            child: Container(
              width: 118,
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFF0F0F0),
                  ),
                ),
              ),
            ),
          ),
          // Text below line 2
          Positioned(
            top: 676,
            left: 222,
            child: Text(
              'Medicine 2',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}