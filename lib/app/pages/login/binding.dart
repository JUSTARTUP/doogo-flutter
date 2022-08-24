import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
