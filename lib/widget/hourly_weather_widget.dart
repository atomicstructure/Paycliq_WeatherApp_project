import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';

class HourlyWeatherWidget extends StatelessWidget{
  const HourlyWeatherWidget({super.key, required this.weatherDataHourly});

  final WeatherDataHourly weatherDataHourly;


  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}