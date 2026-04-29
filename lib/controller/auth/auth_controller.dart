

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  // Firebase Auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  // current user observable (reactive)
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // user change listen (login/logout detect)
    firebaseUser.bindStream(auth.authStateChanges());
  }

  // signup auth method
  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // login auth method
  Future<void> login(String email, String password) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // logout auth method
  Future<void> logout() async {
    await auth.signOut();
  }

  // Getting userId
  String get userId => auth.currentUser!.uid;
}