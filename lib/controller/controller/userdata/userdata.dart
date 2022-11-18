import 'package:edaya_app_test/model/dataModel/data_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserDataController extends GetxController {
  final box = Hive.box<DataModel>(boxName);
  RxList<DataModel> dataModel = <DataModel>[].obs;

  getData() {
    dataModel.value = box.values.toList();
  }

  getAddData(DataModel dataModel) {
    box.add(dataModel);
    getData();
  }

  getDeleteData(int index) {
    box.deleteAt(index);
    getData();
  }

  clearData() {
    box.clear();
    getData();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
