import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/pages/login/login_page.dart';
import 'package:firebase_project/pages/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/app_colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthController controller = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.login_sharp, size: 40,),
            ),
            SizedBox(height: 10,),
            Text("Welcome To SignUp!!", style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w800),),
            SizedBox(height: 40,),
            SignupFormWidget(
                userName: userName,
                email: email,
                password: password,
                formkey: formkey
            ),
            SizedBox(height: 20,),
            Obx(() {
              return ElevatedButton(
                  onPressed: controller.loading.value? null
                      : () async {
                    if(formkey.currentState!.validate()){
                        await controller.signUp(email.text, password.text);
                    }
                  },
                  child: controller.loading.value? Center(child: CircularProgressIndicator(),)
                      : Text("Sign Up", style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),));
            }),
          ],
        ),
      ),
    );
  }

}