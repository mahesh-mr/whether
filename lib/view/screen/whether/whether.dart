import 'package:edaya_app_test/controller/controller/api/wetherdata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhetherMap extends StatelessWidget {
  const WhetherMap({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherApiController whethercontroller = Get.put(WeatherApiController());
    return Scaffold(
      body: 
        
       Container(
            child: GetBuilder<WeatherApiController>(
              init: WeatherApiController(),
              
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.getData()!.daily!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            controller.getData()!.daily![index].temp
                                .toString(),
                          )
                        ],
                      );
                    });
              }
            ))
    
    );
  }
}
