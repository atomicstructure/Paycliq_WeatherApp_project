class WeatherDataDaily{
  List <Daily> daily;
  WeatherDataDaily({required this.daily});


  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) => WeatherDataDaily(
    daily: List<Daily>.from(json['daily'].map((e) => Daily.fromJson(e))),
  );

}

class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  

  Daily(
      {this.dt,
      this.temp,
      this.weather,
      });

  Daily.fromJson(Map<String, dynamic> json) {

    dt = json['dt'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    
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
   
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
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

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}