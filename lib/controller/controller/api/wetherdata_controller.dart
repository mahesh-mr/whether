import 'package:edaya_app_test/controller/service/api/whetherapi.dart';
import 'package:edaya_app_test/model/whetherdata/wheterdata_model/hourly.dart';
import 'package:edaya_app_test/model/whethermodel/whether_model.dart';
import 'package:get/get.dart';

class   WeatherApiController extends GetxController{
final wheterdataModel = WheterdataModel().obs;
 
 WheterdataModel? getData(){
    wheterdataModel.value;
  }

 Future<WhetherModel?> getwhetherController() async {
  var data=await WheterApiservice.getWhether().then((value) {
    wheterdataModel.value=value!;
  
  }) ;
 }
 @override
  void onInit() {
    getwhetherController();
    super.onInit();
  }

}