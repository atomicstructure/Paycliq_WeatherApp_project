import 'package:weatherapp_starter_project/models/weather_data.daily.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';

class WeatherDataCurrent{
  final Current current;
  WeatherDataCurrent({required this.current});


  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) => WeatherDataCurrent(current: Current.fromJson(json['current']));

}

class Current {
  int? temp;
  double? windSpeed;
  double? uvIndex;
  double? feelsLike;
  int? humidity;
  int? clouds;
  List<Weather>? weather;

  Current(
      {
      this.temp,
      this.humidity,
      this.windSpeed,
      this.clouds,
      this.weather,
      this.uvIndex,
      this.feelsLike});

  Current.fromJson(Map<String, dynamic> json) {
    
    temp = (json['temp'] as num?)?.round() ;
    humidity = json['humidity'];
    windSpeed = json['wind_speed'];
    clouds = json['clouds'];
    uvIndex = (json['uvi'] as num).toDouble();
    feelsLike = (json['feels_like'] as num).toDouble();
    
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data['temp'] = (temp as num).round();
    data['humidity'] = humidity;
    data['wind_speed'] = windSpeed;
    data['clouds'] = clouds;
    data['uvi'] = uvIndex;
    data['feels_like'] = feelsLike;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// ignore: camel_case_types
class weather {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  weather(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  weather.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }
  }

  class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

