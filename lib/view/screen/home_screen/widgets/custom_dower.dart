import 'package:edaya_app_test/controller/controller/userdata/userdata.dart';
import 'package:edaya_app_test/view/screen/login/login.dart';
import 'package:edaya_app_test/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomDrower extends StatelessWidget {
  const CustomDrower({
    Key? key,
    required this.storage,
  }) : super(key: key);

  final GetStorage storage;

  @override
  Widget build(BuildContext context) {
    UserDataController controller = Get.find<UserDataController>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: green,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  color: grey,
                  size: 90,
                ),
                const SizedBox(height: 10),
                Text(
                  storage.read("username"),
                  style: noteTitles,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              storage.write("isLogin", false);
              storage.remove('username');
              controller.clearData();
              Get.offAll(LoginScreen());
            },
            leading: const Icon(
              Icons.logout,
              color: green,
            ),
            title: Text(
              "Logout",
              style: drawerText,
            ),
          )
        ],
      ),
    );
  }
}
