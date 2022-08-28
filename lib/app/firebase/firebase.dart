import 'package:Doogo/app/firebase/auth.dart';
import 'package:Doogo/app/firebase/data_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseInterface {
  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firebaseFirestore;
}

class FirebaseApi extends FirebaseInterface
    with FirebaseAuthService, FirebaseFirestoreService {
  @override
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  login() {
    return super.login();
  }
}
