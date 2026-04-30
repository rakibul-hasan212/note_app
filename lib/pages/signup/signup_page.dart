import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/app_colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthController controller = Get.put(AuthController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();

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
            Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: userName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "User-Name",
                        hintText: "Enter your user name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: Icon(Icons.visibility_outlined)
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Confirm-Password",
                          hintText: "Re-write your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: Icon(Icons.visibility_outlined)
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Obx(() {
              return ElevatedButton(
                  onPressed: controller.loading.value? null
                      : () {
                    //Add currentState().validation later
                    controller.signUp(email.text, password.text);
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