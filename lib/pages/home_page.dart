import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../pages_controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = HomeController();
        controller.init();
        return controller;
      },
      child: Consumer<HomeController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Weather'),
              actions: [
                IconButton(
                  onPressed: () => controller.logout(context),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'Enter city name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            controller.fetchWeather(cityController.text.trim());
                          },
                    child: controller.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text('Get Weather'),
                  ),

                  SizedBox(height: 24),

                  if (controller.error != null)
                    Text(
                      controller.error!,
                      style: TextStyle(color: Colors.red),
                    ),

                  if (controller.isLoading && controller.weather == null)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  if (controller.weather != null)
                    _WeatherInfo(controller: controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  final HomeController controller;

  const _WeatherInfo({required this.controller});

  @override
  Widget build(BuildContext context) {
    final weather = controller.weather!;
    final theme = Theme.of(context);

    return Card(
          elevation: 2,
          margin: EdgeInsets.only(top: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      weather!.cityName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Image.network(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${weather.temperature.toStringAsFixed(1)} °C',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      weather.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Divider(height: 24),
                    _WeatherDetail(
                      label: 'Feels like',
                      value: '${weather.feelsLike} °C',
                    ),
                    _WeatherDetail(
                      label: 'Humidity',
                      value: '${weather.humidity} %',
                    ),
                    _WeatherDetail(
                      label: 'Pressure',
                      value: '${weather.pressure} hPa',
                    ),
                    _WeatherDetail(
                      label: 'Wind',
                      value: '${weather.windSpeed} m/s',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.15, end: 0, curve: Curves.easeOutCubic);
  }
}

class _WeatherDetail extends StatelessWidget {
  final String label;
  final String value;

  const _WeatherDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
