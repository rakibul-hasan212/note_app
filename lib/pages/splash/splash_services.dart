
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../login/login_page.dart';

void startApp() async{
  //initialization of AuthController
  final authController = Get.put(AuthController());

  //Splash screen er delay
  await Future.delayed(Duration(seconds: 2));
  //current user logged in or logged out tar value get kore page Navigate korbe
  // authController.firebaseUser.listen((user) {
  //   if (user != null) {
  //     // that means user login already so go to HomePage()
  //     Get.offAll(() => HomePage());
  //   } else {
  //     //that means user have to login first, so go to LoginPage()
  //     Get.offAll(() => LoginPage());
  //   }
  // });

  final user = authController.firebaseUser.value;
  if(user != null){
    Get.offAll(()=> HomePage());//push.Replacement er kaj kore Get.offAll()
  }else{
    Get.offAll(()=> LoginPage());
  }
}