import 'package:Doogo/app/data/controllers/lifecycle.dart';
import 'package:Doogo/app/firebase/auth.dart';
import 'package:Doogo/app/firebase/data_document.dart';
import 'package:get/get.dart';

class AppInitalizer {
  Future<void> init() async {
    Get.put<LifeCycleController>(LifeCycleController());
    await Get.putAsync<DatabaseService>(() => DatabaseService().init());
    await Get.putAsync<FirebaseAuthService>(() => FirebaseAuthService().init());
  }
}
