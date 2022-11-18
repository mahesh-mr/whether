import 'package:edaya_app_test/controller/controller/onbording_controller/onbording.dart';
import 'package:edaya_app_test/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbording extends StatelessWidget {
  Onbording({Key? key}) : super(key: key);
  final _controller = OnbordingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pagecontroller,
              onPageChanged: _controller.selectedIndex,
              itemCount: _controller.onbordingList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          _controller.onbordingList[index].assetImage,
                        ),
                        fit: BoxFit.contain),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                      left: 40,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // Text( _controller.onbordingList[index].title,),

                        // SizedBox(
                        //     width: 300,
                        //     child:Text(_controller
                        //             .onbordingList[index].discriptions,)

                        //      ),
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
            bottom: 25,
            left: 15,
            child: Row(
                children:
                    List.generate(_controller.onbordingList.length, (index) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: _controller.selectedIndex == index ? 25 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _controller.selectedIndex == index ? blue : grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              });
            })),
          ),
          Positioned(
              bottom: 5,
              right: 10,
              child: ElevatedButton(onPressed: () {
                _controller.forwerdAction();
              }, child: Obx(() {
                return Text(
                  _controller.isLastPage ? "Start" : "Next",
                );
              }))),
        ],
      ),
    );
  }
}
