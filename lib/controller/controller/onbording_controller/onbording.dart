import 'package:edaya_app_test/model/onbordin_model/onbording.dart';
import 'package:edaya_app_test/view/screen/login/login.dart';
import 'package:edaya_app_test/view/screen/onbording/onbording.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  var selectedIndex = 0.obs;
  bool get isLastPage => selectedIndex.value == onbordingList.length - 1;
  var pagecontroller = PageController();
  // String? token = TokenStorage.getUserIdAndToken("token");

  forwerdAction() {
    if (isLastPage) {
      Get.offAll(LoginScreen());
    } else {
      pagecontroller.nextPage(duration: 50.milliseconds, curve: Curves.ease);
    }
  }

  List<OnbordingModel> onbordingList = [
    OnbordingModel(
      assetImage: "assets/w6.jpg",
      //  title: "Make your trip",
      // discriptions:
      //     "Travel leaves you speechless then turn you into a storyteller",
    ),
    OnbordingModel(
      assetImage: "assets/w4.jpg",
      // title: "Add More Buddys",
      // discriptions:
      //     "The world is a book and theos who do no travel read only a page",
    ),
    OnbordingModel(
      assetImage: "assets/w5.jpg",
      //  title: "Discover the World",
      // discriptions: "The journy of a thosend miles begins with a single step ",
    ),
  ];

  gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Get.offAll(Onbording());
  }

  @override
  void onInit() {
    gotoHome();
    super.onInit();
  }
}
