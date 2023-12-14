import 'dart:convert';

import 'package:weatherapp_starter_project/api/api_key.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';

class FetchWeatherAPI{
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lng) async{
    var response = await http.get(Uri.parse(apiUrl(lat, lng),),);
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),);
    return weatherData!;
  }
}

String apiUrl(var lat, var lng){
  String url;

  url = 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lng&appid=$apiKey';
  return url;
}