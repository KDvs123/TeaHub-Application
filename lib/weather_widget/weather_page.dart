import 'package:chatbotui/weather_widget/weather_model.dart';
import 'package:chatbotui/weather_widget/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;

  WeatherDisplay({this.weather});

  // Weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/weather_animation/location_icon.json'; // Default weather condition
    }

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return 'assets/weather_animation/sunny.json';
      case 'clouds':
        return 'assets/weather_animation/cloudy.json';
      case 'mist':
      case 'smoke':
      case 'fog':
        return 'assets/weather_animation/mist.json';
      case 'haze':
        return 'assets/weather_animation/haze.json';
      case 'dust':
        return 'assets/weather_animation/dust.json';
      case 'rain':
        return 'assets/weather_animation/rain.json';
      case 'drizzle':
        return 'assets/weather_animation/partly_rain.json';
      case 'shower rain':
        return 'assets/weather_animation/partly_rain.json';
      case 'thunderstorm':
        return 'assets/weather_animation/rain.json';
      default:
        return 'assets/weather_animation/sunny.json';
    }
  }

  // Get the current day of the week
  String getDayOfWeek() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE')
        .format(now); // 'EEEE' will return the full name of the day
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 78, 203, 128),
        borderRadius: BorderRadius.circular(15), // Set border radius here
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 10, 20, 0), // Left, Top, Right, Bottom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Weather condition
                  Text(
                    weather?.mainCondition ?? "Weather...",
                    style: const TextStyle(
                      fontSize: 16, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Weather animation
                  Lottie.asset(getWeatherAnimation(weather?.mainCondition),
                      height: 110),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 10, bottom: 10), // Adjust margins as needed
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust border radius as needed
              child: const VerticalDivider(
                width: 4.0,
                thickness: 4.0, // Adjust thickness as needed
                color: Colors.white, // Change color as needed
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 10, 20, 0), // Left, Top, Right, Bottom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // City name, country
                  Text(
                    weather != null
                        ? '${weather!.cityName}, ${weather!.country}'
                        : "location...",
                    style: const TextStyle(
                      fontSize: 16, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Day
                  Text(
                    '${getDayOfWeek()}',
                    style: const TextStyle(
                      fontSize: 16, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Temperature
                  Text(
                    weather != null
                        ? '${weather?.temperature.round()}°C'
                        : '°C...',
                    style: const TextStyle(
                      fontSize: 30, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  Text(
                    weather != null
                        ? '${((weather!.temperature * 9 / 5) + 32).round()}°F'
                        : '°F...',
                    style: const TextStyle(
                      fontSize: 20, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
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

class WeatherButton extends StatelessWidget {
  final Weather? weather;

  WeatherButton({this.weather});

  @override
  Widget build(BuildContext context) {
    bool locationPermission =
        WeatherService("4a994c4e93b8bbb69680bd5467d568c0").locationPermission;

    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 78, 203, 128),
        borderRadius: BorderRadius.circular(15), // Set border radius here
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class WeatherPage extends StatelessWidget {
  final WeatherService _weatherService =
      WeatherService("4a994c4e93b8bbb69680bd5467d568c0");

  bool locationPermission =
      WeatherService("4a994c4e93b8bbb69680bd5467d568c0").locationPermission;

  // Fetch weather
  Future<Weather?> _fetchWeather() async {
    try {
      String cityName = await _weatherService.getCurrentCity();
      return await _weatherService.getWeather(cityName);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather?>(
      future: _fetchWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: Stack(
              children: [
                WeatherButton(),
                const Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        } else if (locationPermission == true) {
          return WeatherDisplay(weather: snapshot.data);
        } else if (locationPermission == false) {
          return Container(
            child: Stack(
              children: [
                WeatherButton(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching weather 1'));
        } else {
          return WeatherDisplay(weather: snapshot.data);
        }
      },
    );
  }
}
