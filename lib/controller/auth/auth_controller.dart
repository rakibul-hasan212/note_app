
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/widgets/ErrorMassage/error_snackbar.dart';
import 'package:firebase_project/widgets/SuccessSnackBar/success_snackbar.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';

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
      Get.offAllNamed(Routes.Login);
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
      Get.offAllNamed(Routes.Home);
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
      Get.offAllNamed(Routes.Login);
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
      Get.offAllNamed(Routes.Login);
    }catch(e) {
      ErrorSnackBar(e.toString());
    }finally{
      loading.value = false;
    }
  }

  // Getting userId
  String get userId => auth.currentUser!.uid;
}