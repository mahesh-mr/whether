
import '../daly_model/daily.dart';

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
