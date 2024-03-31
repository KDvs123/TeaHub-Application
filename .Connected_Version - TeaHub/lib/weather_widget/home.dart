import 'package:TeaHub/weather_widget/weather_page.dart';
import 'package:flutter/material.dart';

//import 'weather_page.dart'; // Assuming WeatherPage is another widget you want to display

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            WeatherPage(),
            //WPage(),
            //WeatherDisplay(), // Corrected the syntax to specify body for Scaffold
          ],
        ),
      ),

      //SizedBox(height: 30),
      //WeatherPage(), // Corrected the syntax to specify body for Scaffold
    );
  }
}
