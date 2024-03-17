import 'package:flutter/material.dart';

class screen_2 extends StatelessWidget {
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
                'lib/images/screen_2.png', // path to image
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
                      'Chatbot Guidance for\nThriving Greens!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '"Snap your plant woe, chat for a pro! Our app\'s\nyour green guru, diagnosing diseases and bulding growth, leaf by leaf!"',
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
