import 'package:edaya_app_test/controller/controller/userdata/userdata.dart';
import 'package:edaya_app_test/model/dataModel/data_model.dart';
import 'package:edaya_app_test/view/screen/add_users/add_users.dart';
import 'package:edaya_app_test/view/screen/home_screen/widgets/custom_dower.dart';
import 'package:edaya_app_test/view/screen/whether/whether.dart';
import 'package:edaya_app_test/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    final kwidth = SizedBox(width: width * .01);
    return Scaffold(
      backgroundColor: white,
      drawer: CustomDrower(storage: storage),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                ('fdjskjf');
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.menu,
                color: black,
              ),
            );
          },
        ),
        title: Text("Users", style: buttonTextBlack),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AddMembers());
            },
            icon: const Icon(
              Icons.add,
              color: black,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.dataModel.isEmpty) {
          return const Center(
            child: Text("no data"),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .02),
          child: ListView.builder(
            itemCount: controller.dataModel.length,
            itemBuilder: (context, index) {
              DataModel dataModel = controller.dataModel[index];
              return Dismissible(
                key: Key(controller.dataModel[index].toString()),
                background: Container(
                  color: green,
                ),
                secondaryBackground: Container(
                  color: red,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: white,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Delete succesfully")));
                    controller.getDeleteData(index);
                  }
                },
                child: Card(
                  color: wamwhite,
                  child: ListTile(
                    onTap: () {
                      Get.to(const WhetherMap());
                    },
                    title: Row(
                      children: [
                        Text(
                          dataModel.firstName,
                          style: drawerText,
                        ),
                        SizedBox(width: width * .02),
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
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                      activeColor: blue,
                      inactiveThumbColor: grey,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
