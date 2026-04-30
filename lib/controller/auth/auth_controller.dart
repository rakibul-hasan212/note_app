

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/pages/Home/home_page.dart';
import 'package:firebase_project/pages/login/login_page.dart';
import 'package:firebase_project/widgets/ErrorMassage/error_snackbar.dart';
import 'package:firebase_project/widgets/SuccessSnackBar/success_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  // Firebase Auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  // current user observable (reactive)
  Rxn<User> firebaseUser = Rxn<User>();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // user change listen (login/logout detect)
    firebaseUser.bindStream(auth.authStateChanges());
  }

  // signup auth method
  Future<void> signUp(String email, String password) async {
    try{
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SuccessSnackBar("Sign Up");
      Get.offAll(()=> LoginPage());
    }catch(e) {
      ErrorSnackBar(e.toString());
    }finally{
      loading.value = false;
    }
  }

  // login auth method
  Future<void> login(String email, String password) async {
    try{
      loading.value = true;
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SuccessSnackBar("Login");
      Get.offAll(()=> HomePage());
    }catch(e) {
      ErrorSnackBar(e.toString());
    }finally{
      loading.value = false;
    }
  }

  // logout auth method
  Future<void> logout() async {
    try{
      loading.value = true;
      await auth.signOut();
      SuccessSnackBar("Logout");
      Get.offAll(()=> LoginPage());
    }catch(e) {
      ErrorSnackBar(e.toString());
    }finally{
      loading.value = false;
    }
  }

  // ResetPassword using current mail
  Future<void> resetPassword(String email) async {
    try{
      loading.value = false;
      await auth.sendPasswordResetEmail(email: email);
      SuccessSnackBar("Reset Password");
      Get.offAll(()=> LoginPage());
    }catch(e) {
      ErrorSnackBar(e.toString());
    }finally{
      loading.value = false;
    }
  }

  // Getting userId
  String get userId => auth.currentUser!.uid;
}