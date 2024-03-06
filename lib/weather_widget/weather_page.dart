import 'package:chatbotui/weather_widget/weather_model.dart';
import 'package:chatbotui/weather_widget/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class WeatherDisplay extends StatefulWidget {
  final Weather? weather;

  WeatherDisplay({this.weather});

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  // Weather animation
  String getWeatherAnimation(String? mainCondition) {
    DateTime now = DateTime.now();
    if (mainCondition == null) {
      return 'assets/weather_animation/loading.json'; // Default weather condition
    }

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        if (isHourInRange(now) && mainCondition.toLowerCase() == 'clear') {
          return 'assets/weather_animation/clear_night.json';
        } else {
          return 'assets/weather_animation/clear_day.json';
        }

      case 'clouds':
        if (isHourInRange(now) && mainCondition.toLowerCase() == 'clouds') {
          return 'assets/weather_animation/cloudy_night.json';
        } else {
          return 'assets/weather_animation/cloudy_day.json';
        }

      case 'mist':
      case 'smoke':
      case 'fog':
      case 'haze':
      case 'dust':
        if (isHourInRange(now) && mainCondition.toLowerCase() == 'mist') {
          return 'assets/weather_animation/mist_night.json';
        } else {
          return 'assets/weather_animation/mist_day.json';
        }

      case 'rain':
        if (isHourInRange(now) && mainCondition.toLowerCase() == 'rain') {
          return 'assets/weather_animation/rain_night.json';
        } else {
          return 'assets/weather_animation/rain_day.json';
        }

      case 'drizzle':
      case 'shower rain':
        if (isHourInRange(now) && mainCondition.toLowerCase() == 'drizzle') {
          return 'assets/weather_animation/partly_rain_night.json';
        } else {
          return 'assets/weather_animation/partly_rain_day.json';
        }

      case 'thunderstorm':
        if (isHourInRange(now) &&
            mainCondition.toLowerCase() == 'thunderstorm') {
          return 'assets/weather_animation/thunder_strom_night.json';
        } else {
          return 'assets/weather_animation/thunder_strom_day.json';
        }

      default:
        if (isHourInRange(now)) {
          return 'assets/weather_animation/clear_night.json';
        } else {
          return 'assets/weather_animation/clear_day.json';
        }
    }
  }

  // Get the current day of the week
  String getDayOfWeek() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE')
        .format(now); // 'EEEE' will return the full name of the day
  }

  bool isHourInRange(DateTime dateTime) {
    int hour = dateTime.hour;
    return (hour >= 18 && hour <= 24) || (hour >= 1 && hour <= 4);
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
                    widget.weather?.mainCondition ?? "Weather...",
                    style: const TextStyle(
                      fontSize: 16, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Weather animation
                  Lottie.asset(
                      getWeatherAnimation(widget.weather?.mainCondition),
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
                    widget.weather != null
                        ? '${widget.weather!.cityName}, ${widget.weather!.country}'
                        : " Pleace Turn \n On Location",
                    style: const TextStyle(
                      fontSize: 15.5, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Day
                  Text(
                    widget.weather != null ? '${getDayOfWeek()}' : "",
                    //'${getDayOfWeek()}',
                    style: const TextStyle(
                      fontSize: 15.5, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  // Temperature
                  Text(
                    widget.weather != null
                        ? '${widget.weather?.temperature.round()}°C'
                        : "",
                    //'${weather?.temperature.round()}°C',
                    style: const TextStyle(
                      fontSize: 30, // Change the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  Text(
                    widget.weather != null
                        ? '${((widget.weather!.temperature * 9 / 5) + 32).round()}°F'
                        : "",
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
