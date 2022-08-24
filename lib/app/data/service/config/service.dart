import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<AuthService> init() async {
    return this;
  }
}
