import 'package:weatherapp_starter_project/api/api_key.dart';

String apiUrl(var lat, var lng){
  String url;

  url = 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lng&appid=$apiKey';
  return url;
}