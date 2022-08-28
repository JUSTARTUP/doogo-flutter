enum LoginType { phoneNumber, google, apple }

abstract class LoginableInterface {
  Future<void> login();
}

class PhoneNumberLogin implements LoginableInterface {
  @override
  Future<void> login() {
    throw UnimplementedError();
  }
}

class GoogleLogin implements LoginableInterface {
  @override
  Future<void> login() {
    throw UnimplementedError();
  }
}

class AppleLogin implements LoginableInterface {
  @override
  Future<void> login() {
    throw UnimplementedError();
  }
}

class LoginFactory {
  const LoginFactory();
  LoginableInterface initalizeLogin(LoginType loginType) {
    switch (loginType) {
      case LoginType.phoneNumber:
        return PhoneNumberLogin();
      case LoginType.google:
        return GoogleLogin();
      case LoginType.apple:
        return AppleLogin();
    }
  }
}
