import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edaya_app_test/model/whethermodel/whether_model.dart';

class WhetherService {
  static Future<WhetherModels?> getWether() async {
    try {
      var responce = await Dio().get(
          'https://api.openweathermap.org/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=imperial&appid=b143bb707b2ee117e62649b358207d3e');
      WhetherModels model = whetherModelFromJson(
        jsonEncode(responce.data!),
       );
      (responce.data);
      ("success");
      return model;
    } on DioError catch (e) {
      ("dio error cateched service");
      (e.message);
      (e.response!.data);
      (e.type);
      (e);
    } catch (e) {
      ("service catch");
      (e);
    }
  }
}
