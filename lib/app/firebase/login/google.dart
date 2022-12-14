import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ///returns google idToken
  ///중간에 로그인이 취소 될 시 exception 발생
  Future<AuthCredential> authenticate({bool selectAccount = true}) async {
    if (selectAccount) {
      if (kIsWeb) {
        await _googleSignIn.disconnect();
      } else if (Platform.isAndroid) {
        await _googleSignIn.signOut();
      } else {
        await _googleSignIn.disconnect();
      }
    }
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      throw Exception('google 로그인이 취소됨');
    }
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return credential;
  }
}
