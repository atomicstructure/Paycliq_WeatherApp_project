import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widget/comfort_level.dart';
import 'package:weatherapp_starter_project/widget/current_weather.dart';
import 'package:weatherapp_starter_project/widget/daily_weather_widget.dart';
import 'package:weatherapp_starter_project/widget/header_widget.dart';
import 'package:weatherapp_starter_project/widget/hourly_weather_widget.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child: Image.asset(
                    'assets/icons/clouds.png',
                    height: 200,
                    width: 200,
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const HeaderWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      CurrentWeather(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      HourlyWeatherWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DailyWeatherWidget(
                          weatherDataDaily: globalController
                              .getWeatherData()
                              .getDailyWeather()),
                      Container(
                        height: 1,
                        color: CustomColors.dividerline,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather())
                    ],
                  ),
                ))),
    );
  }
}
