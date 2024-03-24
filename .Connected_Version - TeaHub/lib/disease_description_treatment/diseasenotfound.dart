import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'DISEASE NOT FOUND',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Transform.scale(
              scale: 0.95,
              child: Lottie.asset("assets/dieasenotfound/error.json"),
            ),
            const SizedBox(height: 100),
            buildGlassButton(
              context,
              text: 'Redirect to Chatbot',
              iconData: Icons.chat,
              buttonColor: Color(0xFF4ECB81),
              onPressed: () {
                
              },
            ),
            const SizedBox(height: 40),
            buildGlassButton(
              context,
              text: 'Scan Again',
              iconData: Icons.scanner,
              buttonColor: Colors.tealAccent[700]!, 
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGlassButton(BuildContext context, {required String text, required IconData iconData, required Color buttonColor, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton.icon(
          icon: Icon(iconData, color: Colors.white),
          label: Text(text),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: buttonColor.withOpacity(0.7), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadowColor: buttonColor.withOpacity(0.4), 
            elevation: 10,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            side: BorderSide(color: buttonColor, width: 1.5), 
          ),
        ),
      ),
    );
  }
}