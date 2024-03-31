class Weather {
  final String cityName;
  final String country;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
