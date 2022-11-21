import 'package:dio/dio.dart';
import 'package:edaya_app_test/controller/service/whether/whether_service.dart';
import 'package:edaya_app_test/model/whethermodel/whether_model.dart';
import 'package:get/get.dart';

class WhetherApiController extends GetxController {
  final Rx<ApiWhether> whetherModels = ApiWhether().obs;
  RxBool isloding = true.obs;

  Future<ApiWhether?> getWetherController() async {
    try {
      var data = await WhetherService.getWether();
      isloding.value = false;
      print(data!.current!.sunrise);
      return data;
    } on DioError catch (e) {
      isloding.value = false;
      print(e.error);
      (e.message);
      (e);

      ('error on controll dio error');
    } catch (e) {
      (e);
      ('error on controll catch');
    }
  }
}
