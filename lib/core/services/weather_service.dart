import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../weather/models/weather_model.dart';
import '../env_config.dart';

class WeatherService {
  // Future<Map<String, dynamic>> getCurrentWeather(String city) async {
  //   final url =
  //       'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${EnvConfig.weatherApiKey}&units=metric';
  //   final res = await http.get(Uri.parse(url));
  //   if (res.statusCode != 200) {
  //     throw Exception('Failed to fetch weather');
  //   }
  //   return json.decode(res.body);
  // }

  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> fetchWeather(String city) async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];
    final url = Uri.parse(
      '$_baseUrl?q=$city&appid=${EnvConfig.weatherApiKey}&units=metric',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch weather');
    }
  }
}
