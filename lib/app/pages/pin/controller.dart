import 'package:firebase_auth/firebase_auth.dart';
import 'packag:Doogo/app/firebase/auth.dart';
import 'packag:Doogo/app/routes/route.dart';
import 'packag:Doogo/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinValidationPageController extends GetxController with StateMixin {
  final FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  final TextEditingController pinController = TextEditingController();

  final String phoneNumber = "01049928596";

  @override
  void onInit() async {
    await validation();
    super.onInit();
  }

  Future<void> validation() async {
    try {
      authService.sendMessage(phoneNumber);
    } on FirebaseAuthException catch (e) {
      FGBPSnackBar.open("${e.code}");
    }
  }

  Future<void> checkPin() async {
    try {
      String smsCode = pinController.text;
      await authService.checkPhoneAuth(smsCode);
      Get.toNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      FGBPSnackBar.open("인증 실패 : ${e.code}");
    }
  }
}
