class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final int pressure;

  final String condition;
  final String description;
  final String icon;

  final double windSpeed;
  final int windDegree;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.condition,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.windDegree,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      condition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      windDegree: json['wind']['deg'],
    );
  }
}
