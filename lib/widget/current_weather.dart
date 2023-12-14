import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, required this.weatherDataCurrent});

  final WeatherDataCurrent weatherDataCurrent;

  

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        temperatureAreaWidget(),


        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Container();
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/weather/${weatherDataCurrent.current.weather?[0].icon}.png',
        height: 80,
        width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerline,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${weatherDataCurrent.current.temp}°',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack
                )
              ),
              TextSpan(
                text: '${weatherDataCurrent.current.weather![0].description}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: CustomColors.textColorBlack
                )
              )
            ]
          )
        )
      ],
    );
  }
}