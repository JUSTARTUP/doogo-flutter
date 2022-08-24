import 'packag:Doogo/app/pages/pin/controller.dart';
import 'package:get/get.dart';

class PinValidationPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinValidationPageController>(
        () => PinValidationPageController());
  }
}
