import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx_boilerplate/app/widgets/snackbar.dart';
import 'package:firebase_getx_boilerplate/app/widgets/toast.dart';
import 'package:get/get.dart';

enum AuthState { isNotRegistered, isAuthenticated, anymore }

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Rx<AuthState> _currentState = AuthState.anymore.obs;
  final RxString _verficationId = "".obs;

  AuthState get currentState => _currentState.value;

  Future<FirebaseAuthService> init() async {
    _firebaseAuth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser != null) {
        _currentState.value = AuthState.isAuthenticated;
      } else {
        _currentState.value = AuthState.isNotRegistered;
      }
    });
    return this;
  }

  Future<String> login(String id, String password) async {
    return "";
  }

  //문자 보내기
  Future<void> sendMessage(String phoneNumber) async {
    _firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: "+82${phoneNumber}",
      verificationCompleted: (PhoneAuthCredential p) {},
      verificationFailed: (FirebaseAuthException f) {
        throw f;
      },
      codeSent: (String id, int? token) {
        _verficationId.value = id;
        FGBPSnackBar.open("${phoneNumber}로 인증코드를 발송하였습니다");
      },
      codeAutoRetrievalTimeout: (String code) {},
    );
  }

  //최종 체크
  Future<void> checkPhoneAuth(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verficationId.value, smsCode: smsCode);
    try {
      final authCredential =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        FGBPToast.open("인증 완료 및 로그인 성공");
      }
      //_firebaseAuth.currentUser!.delete();
      // _firebaseAuth.signOut();
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  Future<UserCredential?> loginWithEmail(String email, String password) async {
    try {
      final credentials = _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  void loginWithGoogle() {}
}
