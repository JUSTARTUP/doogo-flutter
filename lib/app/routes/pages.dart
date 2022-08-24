import 'package:firebase_getx_boilerplate/app/pages/home/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/pin/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/pin/page.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        binding: LoginPageBinding()),
    GetPage(
        name: Routes.pin,
        page: () => PinValidationPage(),
        binding: PinValidationPageBinding()),
  ];
}
