import 'package:weatherapp_starter_project/models/weather/daily.dart';
import 'package:weatherapp_starter_project/models/weather/hourly.dart';

class WeatherDataCurrent{
  final Current current;
  WeatherDataCurrent({required this.current});
  
}

class Current {
  double? temp;
  double? windSpeed;
  int? humidity;
  int? clouds;
  List<Weather>? weather;

  Current(
      {
      this.temp,
      this.humidity,
      this.windSpeed,
      this.clouds,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    
    temp = json['temp'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
    clouds = json['clouds'];
    
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['windSpeed'] = windSpeed;
    data['clouds'] = clouds;
    
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

