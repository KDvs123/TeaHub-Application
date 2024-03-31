import 'package:flutter/material.dart';

class screen_3 extends StatelessWidget {
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
                'lib/images/screen_3.png', // path to image
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
                color: Theme.of(context).colorScheme.background,
                height: 410,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Your Green Guru for Growing Success!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '"Unlock the Green World: Your Ultimate Plant\nEncyclopedia! Delve into climate needs, water\nsecrets, and harvest timing for lush, thriving plants."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
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
