import 'package:edaya_app_test/controller/service/whether/whether_service.dart';
import 'package:edaya_app_test/model/whethermodel/whether_model.dart';
import 'package:get/get.dart';

class WhetherController extends GetxController {
  WhetherModel? whetherModel;

  RxBool isloding = true.obs;
  Future<WhetherModel?> whetherController() async {
    try {
      var data = await WhetherService.getWether();
      isloding.value = false;
      return data;
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      (e);
      ('catch bloc called');
      isloding.value = false;
    }
  }

  @override
  void onInit() {
    whetherController().then((value) => whetherModel);
    super.onInit();
  }
}
