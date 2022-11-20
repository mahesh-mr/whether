import 'package:edaya_app_test/controller/controller/api/wetherdata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhetherMap extends StatelessWidget {
  const WhetherMap({super.key});

  @override
  Widget build(BuildContext context) {
    WhetherApiController apiController = Get.put(WhetherApiController());
    // WeatherApiController whethercontroller = Get.put(WeatherApiController());
    return Scaffold(
      body: Obx(() {
        if (apiController.isloding.value) {
          Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              child: Text(apiController
                  .whetherModels.value.daily![index].humidity
                  .toString()),
            );
          },
        );
      }),

      // Obx(
      //   () {
      //     if (apiController.isloding.value) {
      //       Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return ListView.builder(
      //         itemCount: apiController.whetherModels.value.daily!.length,
      //         itemBuilder: (context, index) {
      //           return Column(
      //             children: [
      //               Text(
      //                 apiController.whetherModels.value.daily![index].humidity
      //                     .toString(),
      //               )
      //             ],
      //           );
      //         });
      //   },
      // ),
    );
  }
}
