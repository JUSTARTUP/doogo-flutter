import 'package:firebase_getx_boilerplate/app/firebase/auth.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final FirebaseAuthService _authService = Get.find<FirebaseAuthService>();

  Future<void> loginWithGoogle() async {
    //_authService.loginWithGoogle();
    if (kDebugMode) {
      //FGBPToast.open("아직 구현되지 않았습니다");
      //FGBPSnackBar.open("아직 구현되지 않았습니다");
      Get.toNamed(Routes.pin);
      return;
    }
  }

  Future<void> loginWithApple() async {
    //_authService.loginWithGoogle();
    if (kDebugMode) {
      //FGBPToast.open("아직 구현되지 않았습니다");
      FGBPSnackBar.open("아직 구현되지 않았습니다");

      //Get.toNamed(Routes.pin);
      return;
    }
  }

  @override
  void onInit() {
    if (_authService.currentState == AuthState.isAuthenticated) {
      Get.toNamed(Routes.home);
    }
    super.onInit();
  }
}
