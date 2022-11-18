// ignore_for_file: prefer_const_constructors


import 'package:edaya_app_test/controller/controller/userdata/userdata.dart';
import 'package:edaya_app_test/model/dataModel/data_model.dart';
import 'package:edaya_app_test/view/screen/login/widgets/custom_button.dart';
import 'package:edaya_app_test/view/screen/login/widgets/custom_textform.dart';
import 'package:edaya_app_test/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMembers extends StatelessWidget {
  AddMembers({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> fonmkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserDataController controller = Get.put(UserDataController());
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          "Add Details",
          style: buttonTextBlack,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Card(
                color: wamwhite,
                child: Form(
                  key: fonmkey,
                  child: GetBuilder<UserDataController>(
                      init: UserDataController(),
                      dispose: (_) {
                        firstName.dispose();
                        lastName.dispose();
                        email.dispose();
                      },
                      builder: (controler) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              firstnameForm(),
                              lastnameFprm(),
                              emailForm(),
                              CustomButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Save Details"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () => Get.back(),
                                            child: Text("Cancel"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              DataModel dataModel = DataModel(
                                                  email: email.text,
                                                  firstName: firstName.text,
                                                  secondName: lastName.text);
                                              if (fonmkey.currentState!
                                                  .validate()) {
                                                Get.back();
                                                Get.back();
                                                controller
                                                    .getAddData(dataModel);
                                                Get.snackbar(
                                                    "User", "Details Added",
                                                    icon: const Icon(
                                                        Icons.thumb_up),
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                                controller.getData();
                                              }
                                            },
                                            child: Text("Save"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  title: "submit"),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 45)),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Save Details"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () => Get.back(),
                                            child: Text("Cancel"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              DataModel dataModel = DataModel(
                                                  email: email.text,
                                                  firstName: firstName.text,
                                                  secondName: lastName.text);
                                              if (fonmkey.currentState!
                                                  .validate()) {
                                                Get.back();
                                                Get.back();
                                                controller
                                                    .getAddData(dataModel);
                                                Get.snackbar(
                                                    "User", "Details Added",
                                                    icon: const Icon(
                                                        Icons.thumb_up),
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                                controller.getData();
                                              }
                                            },
                                            child: Text("Save"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text("submit")),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomTextForm firstnameForm() {
    return CustomTextForm(
      controller: firstName,
      icons: Icons.person,
      maxline: 1,
      textinputType: TextInputType.name,
      title: "First Name",
      validator: (value) {
        if (value!.length == 0) {
          return "Enter your firstname";
        } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
    );
  }

  CustomTextForm lastnameFprm() {
    return CustomTextForm(
      controller: lastName,
      icons: Icons.person,
      maxline: 1,
      textinputType: TextInputType.name,
      title: "SecondName",
      validator: (value) {
        if (value!.length == 0) {
          return "Enter your secondname";
        } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
    );
  }

  CustomTextForm emailForm() {
    return CustomTextForm(
      controller: email,
      icons: Icons.email,
      maxline: 1,
      textinputType: TextInputType.emailAddress,
      title: "Email",
      validator: (value) {
        if (value == null) {
          return "Required Field";
        } else if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return "Enter a valid email";
        } else {
          return null;
        }
      },
    );
  }
}
