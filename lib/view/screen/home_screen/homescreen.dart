import 'package:edaya_app_test/controller/controller/userdata/userdata.dart';
import 'package:edaya_app_test/model/dataModel/data_model.dart';
import 'package:edaya_app_test/view/screen/add_users/add_users.dart';
import 'package:edaya_app_test/view/screen/home_screen/widgets/custom_dower.dart';
import 'package:edaya_app_test/view/screen/whether/whether.dart';
import 'package:edaya_app_test/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    UserDataController controller = Get.put(UserDataController());

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final kwidth = SizedBox(
      width: width * .01,
    );
    return Scaffold(
      backgroundColor: white,
      drawer: CustomDrower(storage: storage),
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text("Users", style: buttonTextBlack),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AddMembers());
            },
            icon: const Icon(
              Icons.add,
              color: green,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.dataModel.isEmpty) {
          return Center(
            child: Text("no data"),
          );
        }

        return ListView.builder(
          itemCount: controller.dataModel.length,
          itemBuilder: (context, index) {
            DataModel dataModel = controller.dataModel[index];
            return Card(
              color: wamwhite,
              child: ListTile(
                onTap: () {
                  Get.to(WhetherMap());
                },
                title: Row(
                  children: [
                    Text(
                      dataModel.firstName,
                      style: drawerText,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      dataModel.secondName,
                      style: drawerText,
                    ),
                  ],
                ),
                subtitle: Text(
                  dataModel.email,
                  style: drawerText,
                ),
                // trailing: Switch(value: true, onChanged: (val) {}),
              ),
            );
          },
        );
      }),
    );
  }
}
