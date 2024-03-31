import 'dart:convert';
import 'package:chatbotui/weather_widget/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apikey;

  bool locationPermission = true; // Boolean variable to track permission

  WeatherService(this.apikey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apikey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    // Check if permission has been granted
    LocationPermission permission = await Geolocator.checkPermission();
    // permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      locationPermission = false;
    } else {
      locationPermission = true;
    }

    // If permission is granted, fetch the current location
    if (locationPermission) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // convert the location into a list of placemark objects
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // extract the city name from the first placemark
      String? city = placemarks[0].locality;

      return city ?? "";
    } else {
      throw Exception('Location permission not granted');
    }
  }
}
