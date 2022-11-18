import 'dart:convert';

import 'package:edaya_app_test/model/whetherdata/wheterdata_model/hourly.dart';
import 'package:http/http.dart'as http;

class WheterApiservice{
  WheterdataModel? whetherdata;



 static Future<WheterdataModel?>getWhether()async{
  String url ="https://api.openweathermap.org/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=metric&appid=b143bb707b2ee117e62649b358207d3e";
    var responce =await http.get(Uri.parse(url));
    var jsonsting =jsonDecode(responce.body);
  WheterdataModel  whetherdata =WheterdataModel.fromJson(jsonsting);
    return whetherdata;
  }

}