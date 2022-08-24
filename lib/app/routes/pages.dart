import 'package:Doogo/app/pages/home/binding.dart';
import 'package:Doogo/app/pages/home/page.dart';
import 'package:Doogo/app/pages/login/binding.dart';
import 'package:Doogo/app/pages/login/page.dart';
import 'package:Doogo/app/pages/pin/binding.dart';
import 'package:Doogo/app/pages/pin/page.dart';
import 'package:Doogo/app/routes/route.dart';
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
