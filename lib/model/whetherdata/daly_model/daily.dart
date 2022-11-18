
import '../wheterdata_model/temp.dart';

//whether=================
class WheterdataModel {
  List<Daily>? daily;

  WheterdataModel({
    this.daily,
  });

  factory WheterdataModel.fromJson(Map<String, dynamic> json) {
    return WheterdataModel(
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'daily': daily?.map((e) => e.toJson()).toList(),
      };
}

class Daily {
  Temp? temp;

  int? humidity;

  double? windSpeed;

  List<Weather>? weather;

  Daily({
    this.temp,
    this.humidity,
    this.windSpeed,
    this.weather,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        humidity: json['humidity'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
