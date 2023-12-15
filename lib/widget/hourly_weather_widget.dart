import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget{
  const HourlyWeatherWidget({super.key, required this.weatherDataHourly});

  final WeatherDataHourly weatherDataHourly;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text('Today', 
          style: TextStyle(
            fontSize: 18,
            ),
          ),
        ),
        hourlyList()
      ],
    );
  }
  Widget hourlyList(){
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12 ? 12 : weatherDataHourly.hourly.length ,
        itemBuilder:((context, index) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.5,0), 
                  blurRadius: 30, spreadRadius: 1, 
                  color: CustomColors.dividerline.withAlpha(150),
                )
              ],
              gradient: const LinearGradient(
                colors: [
                  CustomColors.firstGradientColor, 
                  CustomColors.secondGradientColor],
                ),
          ),
          child:  HourlyDetails(
            temp: weatherDataHourly.hourly[index].temp!,
            timeStamp: weatherDataHourly.hourly[index].dt!,
            weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
          ),
          ),
        ); 
      })),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  HourlyDetails({super.key, required this.temp, required this.timeStamp, required this.weatherIcon});

  int temp;
  int timeStamp;
  String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(timeStamp.toString()),
        )
      ],
    );
  }
}