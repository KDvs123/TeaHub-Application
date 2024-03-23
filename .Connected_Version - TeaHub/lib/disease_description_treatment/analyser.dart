import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash Screen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Make the .json animation smaller
            Transform.scale(
              scale: 0.65, // Adjust scale to make animation smaller
              child: Lottie.asset("assets/Analyser2.json"),
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 2),
              builder: (context, double value, child) {
                // Making the dots "..." animated
                String dots = List.generate((value * 3).toInt(), (index) => ".").join();
                return ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Analysing$dots",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


