import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, required this.weatherDataCurrent});

  final WeatherDataCurrent weatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherDataCurrent.current.weather?[0].description}'),
    );
  }
}