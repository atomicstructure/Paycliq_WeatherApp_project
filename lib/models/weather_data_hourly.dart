class WeatherDataHourly{
  final Hourly hourly;
  WeatherDataHourly({required this.hourly});


  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) => WeatherDataHourly(hourly: Hourly.fromJson(json['current'],),);

}

class Hourly {
  int? dt;
  int? temp;
  
  List<Weather>? weather;
  

  Hourly(
      {this.dt,
      this.temp,
      this.weather,
      });

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = (json['temp'] as num?)?.round();
    
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    data['temp'] = temp;
    
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    return data;
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