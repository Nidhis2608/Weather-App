import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get weatherApiKey => dotenv.env['WEATHER_API_KEY'] ?? '';

  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
}
