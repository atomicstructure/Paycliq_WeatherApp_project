import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  const ComfortLevel({super.key, required this.weatherDataCurrent});
  final WeatherDataCurrent weatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text('Comfort Level', style: TextStyle(fontSize: 18),),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    animationEnabled: true,
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Humidity', 
                      bottomLabelStyle: const TextStyle(
                        letterSpacing: 0.1, 
                        fontSize: 14, 
                        height: 1.4,
                        ),
                      ),
                  size: 140,
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    trackColor: CustomColors.firstGradientColor.withAlpha(100),
                    progressBarColors: [
                      CustomColors.firstGradientColor, 
                      CustomColors.secondGradientColor,])
                  )
                ,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Feels Like',
                        style: TextStyle(
                          color: CustomColors.textColorBlack, fontSize: 14, height: 0.8, fontWeight: FontWeight.w400,
                        )
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 5,
                            ),
                          ),
                        TextSpan(
                        text: '${weatherDataCurrent.current.feelsLike}',
                        style: const TextStyle(
                          color: CustomColors.textColorBlack, fontSize: 14, height: 0.8, fontWeight: FontWeight.w400,
                        )
                        )
                      ]
                  )),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerline,
                  ),
                  RichText(
                    text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Uv Index',
                        style: TextStyle(
                          color: CustomColors.textColorBlack, fontSize: 14, height: 0.8, fontWeight: FontWeight.w400,
                        )
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 5,
                            ),
                          ),
                        TextSpan(
                        text: '${weatherDataCurrent.current.uvIndex}%',
                        style: const TextStyle(
                          color: CustomColors.textColorBlack, fontSize: 14, height: 0.8, fontWeight: FontWeight.w400,
                        )
                        )
                      ]
                  )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}