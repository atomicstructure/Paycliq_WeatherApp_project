import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widget/current_weather.dart';
import 'package:weatherapp_starter_project/widget/daily_weather_widget.dart';
import 'package:weatherapp_starter_project/widget/header_widget.dart';
import 'package:weatherapp_starter_project/widget/hourly_weather_widget.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading()
        .isTrue ? const Center(
          child: CircularProgressIndicator(),
        )
        : Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 16,),
              const HeaderWidget(),
              const SizedBox(height: 16,),
              CurrentWeather(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),
              ),
              const SizedBox(height: 16,),
              HourlyWeatherWidget(weatherDataHourly: globalController.getWeatherData().getHourlyWeather(),
              ),
              const SizedBox(height: 16,),
              DailyWeatherWidget(weatherDataDaily: globalController.getWeatherData().getDailyWeather())
              
            ],
          ),
        )
      )
    ),
  );
}
}