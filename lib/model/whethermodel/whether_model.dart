// // To parse this JSON data, do
// //
// //     final whetherModel = whetherModelFromJson(jsonString);

// import 'dart:convert';

// WhetherModel whetherModelFromJson(String str) =>
//     WhetherModel.fromJson(json.decode(str));

// String whetherModelToJson(WhetherModel data) => json.encode(data.toJson());

// class WhetherModel {
//   WhetherModel({
//     this.lat,
//     this.lon,
//     this.timezone,
//     this.timezoneOffset,
//     this.current,
//     this.minutely,
//     this.hourly,
//     this.daily,
//   });

//   double? lat;
//   double? lon;
//   String? timezone;
//   int? timezoneOffset;
//   Current? current;
//   List<Minutely>? minutely;
//   List<Current>? hourly;
//   List<Daily>? daily;

//   factory WhetherModel.fromJson(Map<String, dynamic> json) => WhetherModel(
//         lat: json["lat"].toDouble(),
//         lon: json["lon"].toDouble(),
//         timezone: json["timezone"],
//         timezoneOffset: json["timezone_offset"],
//         current: Current.fromJson(json["current"]),
//         minutely: List<Minutely>.from(
//             json["minutely"].map((x) => Minutely.fromJson(x))),
//         hourly:
//             List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
//         daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lon": lon,
//         "timezone": timezone,
//         "timezone_offset": timezoneOffset,
//         "current": current!.toJson(),
//         "minutely": List<dynamic>.from(minutely!.map((x) => x.toJson())),
//         "hourly": List<dynamic>.from(hourly!.map((x) => x.toJson())),
//         "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
//       };
// }

// class Current {
//   Current({
//     this.dt,
//     this.sunrise,
//     this.sunset,
//     this.temp,
//     this.feelsLike,
//     this.pressure,
//     this.humidity,
//     this.dewPoint,
//     this.uvi,
//     this.clouds,
//     this.visibility,
//     this.windSpeed,
//     this.windDeg,
//     this.weather,
//     this.windGust,
//     this.pop,
//   });

//   int? dt;
//   int? sunrise;
//   int? sunset;
//   double? temp;
//   double? feelsLike;
//   int? pressure;
//   int? humidity;
//   double? dewPoint;
//   double? uvi;
//   int? clouds;
//   int? visibility;
//   double? windSpeed;
//   int? windDeg;
//   List<Weather>? weather;
//   double? windGust;
//   int? pop;

//   factory Current.fromJson(Map<String, dynamic> json) => Current(
//         dt: json["dt"],
//         sunrise: json["sunrise"] == null ? null : json["sunrise"],
//         sunset: json["sunset"] == null ? null : json["sunset"],
//         temp: json["temp"].toDouble(),
//         feelsLike: json["feels_like"].toDouble(),
//         pressure: json["pressure"],
//         humidity: json["humidity"],
//         dewPoint: json["dew_point"].toDouble(),
//         uvi: json["uvi"].toDouble(),
//         clouds: json["clouds"],
//         visibility: json["visibility"],
//         windSpeed: json["wind_speed"].toDouble(),
//         windDeg: json["wind_deg"],
//         weather:
//             List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         windGust:
//             json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
//         pop: json["pop"] == null ? null : json["pop"],
//       );

//   Map<String, dynamic> toJson() => {
//         "dt": dt,
//         "sunrise": sunrise == null ? null : sunrise,
//         "sunset": sunset == null ? null : sunset,
//         "temp": temp,
//         "feels_like": feelsLike,
//         "pressure": pressure,
//         "humidity": humidity,
//         "dew_point": dewPoint,
//         "uvi": uvi,
//         "clouds": clouds,
//         "visibility": visibility,
//         "wind_speed": windSpeed,
//         "wind_deg": windDeg,
//         "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
//         "wind_gust": windGust == null ? null : windGust,
//         "pop": pop == null ? null : pop,
//       };
// }

// class Weather {
//   Weather({
//     this.id,
//     this.main,
//     this.description,
//     this.icon,
//   });

//   int? id;
//   Main? main;
//   Description? description;
//   Icon? icon;

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         id: json["id"],
//         main: mainValues.map![json["main"]],
//         description: descriptionValues.map![json["description"]],
//         icon: iconValues.map![json["icon"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "main": mainValues.reverse[main],
//         "description": descriptionValues.reverse[description],
//         "icon": iconValues.reverse[icon],
//       };
// }

// enum Description {
//   MIST,
//   BROKEN_CLOUDS,
//   OVERCAST_CLOUDS,
//   SCATTERED_CLOUDS,
//   LIGHT_RAIN,
//   FEW_CLOUDS
// }

// final descriptionValues = EnumValues({
//   "broken clouds": Description.BROKEN_CLOUDS,
//   "few clouds": Description.FEW_CLOUDS,
//   "light rain": Description.LIGHT_RAIN,
//   "mist": Description.MIST,
//   "overcast clouds": Description.OVERCAST_CLOUDS,
//   "scattered clouds": Description.SCATTERED_CLOUDS
// });

// enum Icon { THE_50_D, THE_04_D, THE_03_D, THE_10_D, THE_02_D, THE_04_N }

// final iconValues = EnumValues({
//   "02d": Icon.THE_02_D,
//   "03d": Icon.THE_03_D,
//   "04d": Icon.THE_04_D,
//   "04n": Icon.THE_04_N,
//   "10d": Icon.THE_10_D,
//   "50d": Icon.THE_50_D
// });

// enum Main { MIST, CLOUDS, RAIN }

// final mainValues =
//     EnumValues({"Clouds": Main.CLOUDS, "Mist": Main.MIST, "Rain": Main.RAIN});

// class Daily {
//   Daily({
//     this.dt,
//     this.sunrise,
//     this.sunset,
//     this.moonrise,
//     this.moonset,
//     this.moonPhase,
//     this.temp,
//     this.feelsLike,
//     this.pressure,
//     this.humidity,
//     this.dewPoint,
//     this.windSpeed,
//     this.windDeg,
//     this.windGust,
//     this.weather,
//     this.clouds,
//     this.pop,
//     this.uvi,
//     this.rain,
//   });

//   int? dt;
//   int? sunrise;
//   int? sunset;
//   int? moonrise;
//   int? moonset;
//   double? moonPhase;
//   Temp? temp;
//   FeelsLike? feelsLike;
//   int? pressure;
//   int? humidity;
//   double? dewPoint;
//   double? windSpeed;
//   int? windDeg;
//   double? windGust;
//   List<Weather>? weather;
//   int? clouds;
//   double? pop;
//   double? uvi;
//   double? rain;

//   factory Daily.fromJson(Map<String, dynamic> json) => Daily(
//         dt: json["dt"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//         moonrise: json["moonrise"],
//         moonset: json["moonset"],
//         moonPhase: json["moon_phase"].toDouble(),
//         temp: Temp.fromJson(json["temp"]),
//         feelsLike: FeelsLike.fromJson(json["feels_like"]),
//         pressure: json["pressure"],
//         humidity: json["humidity"],
//         dewPoint: json["dew_point"].toDouble(),
//         windSpeed: json["wind_speed"].toDouble(),
//         windDeg: json["wind_deg"],
//         windGust: json["wind_gust"].toDouble(),
//         weather:
//             List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         clouds: json["clouds"],
//         pop: json["pop"].toDouble(),
//         uvi: json["uvi"].toDouble(),
//         rain: json["rain"] == null ? null : json["rain"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "dt": dt,
//         "sunrise": sunrise,
//         "sunset": sunset,
//         "moonrise": moonrise,
//         "moonset": moonset,
//         "moon_phase": moonPhase,
//         "temp": temp!.toJson(),
//         "feels_like": feelsLike!.toJson(),
//         "pressure": pressure,
//         "humidity": humidity,
//         "dew_point": dewPoint,
//         "wind_speed": windSpeed,
//         "wind_deg": windDeg,
//         "wind_gust": windGust,
//         "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
//         "clouds": clouds,
//         "pop": pop,
//         "uvi": uvi,
//         "rain": rain == null ? null : rain,
//       };
// }

// class FeelsLike {
//   FeelsLike({
//     this.day,
//     this.night,
//     this.eve,
//     this.morn,
//   });

//   double? day;
//   double? night;
//   double? eve;
//   double? morn;

//   factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
//         day: json["day"].toDouble(),
//         night: json["night"].toDouble(),
//         eve: json["eve"].toDouble(),
//         morn: json["morn"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "day": day,
//         "night": night,
//         "eve": eve,
//         "morn": morn,
//       };
// }

// class Temp {
//   Temp({
//     this.day,
//     this.min,
//     this.max,
//     this.night,
//     this.eve,
//     this.morn,
//   });

//   double? day;
//   double? min;
//   double? max;
//   double? night;
//   double? eve;
//   double? morn;

//   factory Temp.fromJson(Map<String, dynamic> json) => Temp(
//         day: json["day"].toDouble(),
//         min: json["min"].toDouble(),
//         max: json["max"].toDouble(),
//         night: json["night"].toDouble(),
//         eve: json["eve"].toDouble(),
//         morn: json["morn"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "day": day,
//         "min": min,
//         "max": max,
//         "night": night,
//         "eve": eve,
//         "morn": morn,
//       };
// }

// class Minutely {
//   Minutely({
//     this.dt,
//     this.precipitation,
//   });

//   int? dt;
//   int? precipitation;

//   factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
//         dt: json["dt"],
//         precipitation: json["precipitation"],
//       );

//   Map<String, dynamic> toJson() => {
//         "dt": dt,
//         "precipitation": precipitation,
//       };
// }

// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map!.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap!;
//   }
// }

// To parse this JSON data, do
//
//     final whetherModel = whetherModelFromJson(jsonString);

import 'dart:convert';

WhetherModel whetherModelFromJson(String str) =>
    WhetherModel.fromJson(json.decode(str));

String whetherModelToJson(WhetherModel data) => json.encode(data.toJson());

class WhetherModel {
  WhetherModel({
    this.whether,
  });

  Whether? whether;

  factory WhetherModel.fromJson(Map<String, dynamic> json) => WhetherModel(
        whether: Whether.fromJson(json["whether"]),
      );

  Map<String, dynamic> toJson() => {
        "whether": whether!.toJson(),
      };
}

class Whether {
  Whether({
    this.timezone,
    this.current,
    this.daily,
  });

  String? timezone;
  Current? current;
  List<Daily>? daily;

  factory Whether.fromJson(Map<String, dynamic> json) => Whether(
        timezone: json["timezone"],
        current: Current.fromJson(json["current"]),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "current": current!.toJson(),
        "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.sunrise,
    this.sunset,
    this.temp,
    this.humidity,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.weather,
  });

  int? sunrise;
  int? sunset;
  double? temp;
  int? humidity;
  int? clouds;
  int? visibility;
  int? windSpeed;
  List<Weather>? weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        humidity: json["humidity"],
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "humidity": humidity,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? uvi;
  double? rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp!.toJson(),
        "feels_like": feelsLike!.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain == null ? null : rain,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
