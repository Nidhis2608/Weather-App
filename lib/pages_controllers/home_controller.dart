import 'package:flutter/material.dart';
import 'package:weather_app/core/services/local_storage_service.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/weather_service.dart';
import '../../weather/models/weather_model.dart';

class HomeController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final WeatherService _weatherService = WeatherService();
  final LocalStorageService _localStorage = LocalStorageService();

  WeatherModel? weather;
  bool isLoading = false;
  String? error;

  Future<void> init() async {
    final lastCity = await _localStorage.getLastCity();
    if (lastCity != null && lastCity.isNotEmpty) {
      await fetchWeather(lastCity);
    }
  }

  Future<void> logout(BuildContext context) async {
    await _authService.signOut();
  }

  Future<void> fetchWeather(String city) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      weather = await _weatherService.fetchWeather(city);
      await _localStorage.saveLastCity(city);
      print('Saved city: $city');
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
