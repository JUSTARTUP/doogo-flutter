import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AppConfigService extends GetxService {
  late Box box;

  Future<AppConfigService> init() async {
    box = await Hive.openBox('config');
    return this;
  }

  void clearConfigs() {
    box.clear();
  }

  @override
  void onClose() async {
    await box.close();
    super.onClose();
  }
}
