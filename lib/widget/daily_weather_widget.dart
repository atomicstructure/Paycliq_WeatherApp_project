import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data.daily.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({super.key, required this.weatherDataDaily});

  final WeatherDataDaily weatherDataDaily;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
        )
      ],
    );
  }
}