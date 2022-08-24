import 'package:firebase_core/firebase_core.dart';
import 'packag:Doogo/app/data/initalize.dart';
import 'packag:Doogo/app/routes/pages.dart';
import 'packag:Doogo/app/routes/route.dart';
import 'packag:Doogo/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Do Firebase Initial Settings With Firebase CLI
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppInitalizer().init();
  runApp(GetMaterialApp(
    initialRoute: Routes.login,
    getPages: AppPages.pages,
    theme: ThemeData(fontFamily: "Pretendard"),
  ));
}
