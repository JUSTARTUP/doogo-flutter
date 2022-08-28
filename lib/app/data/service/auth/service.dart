import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

enum AuthState { isNotRegistered, isAuthenticated, anymore }

class AuthService extends GetxService {
  final Rx<AuthState> _currentState = AuthState.anymore.obs;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rx<String?> _token = Rx(null);
  final Rx<bool> _isFirstVisit = Rx(false);
  final AuthRepository repository;

  String get token => _token.value!;
  bool get isAuthenticated => _token.value != null;
  bool get isFirstVisit => _isFirstVisit.value;
  AuthState get currentState => _currentState.value;

  AuthService(this.repository);

  Future<AuthService> init() async {
    //_isFirstVisit.value = await _storage.read(key: 'isFirstVisit');
    //_isFirstVisit.value = await _storage.read(key: 'isFirstVisit');
    return this;
  }

  Future<void> _setIsFirstVisit(String token) async {
    await _storage.write(key: 'isFirstVisit', value: token);
    _isFirstVisit.value = token;
  }

  Future<void> _setToken(String token) async {
    await _storage.write(key: 'token', value: token);
    _token.value = token;
  }
}
