
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/core/routes/app_routes.dart';
import 'package:firebase_project/pages/forget%20password/forget_password_page.dart';
import 'package:firebase_project/pages/login/bottom_part.dart';
import 'package:firebase_project/pages/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});
  final AuthController controller = Get.put(AuthController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.login_outlined,size: 40,),
            ),
            SizedBox(height: 10,),
            Text("Welcome!!",style: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.w800),),
            SizedBox(height:40,),
            LoginFormWidget(
                email: email,
                password: password,
                formKey: formKey
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx((){
                      return Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value){
                            controller.rememberMe.value = value! ;
                          });
                    }),
                    Text("Remember me")
                  ],
                ),
                InkWell(
                    onTap: (){
                      Get.to(ForgetPasswordPage());
                    },
                    child: Text("Forget Password?",style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),))
              ],
            ),
            SizedBox(height: 20,),
            Obx(() {
              return ElevatedButton(
                  onPressed: controller.loading.value? null
                      : () async {
                    //Add currentState().validation
                    if(formKey.currentState!.validate()){
                        await controller.login(email.text, password.text);
                    }
                  },
                  child: controller.loading.value? Center(child: CircularProgressIndicator(),)
                      : Text("Login", style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w600),));
            }),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you have any accounts?"),
                SizedBox(width: 5,),
                InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUpPage()));
                      Get.toNamed(Routes.Signup);
                    },
                    child: Text("Sign Up",style: TextStyle(color: AppColors.textPrimary, fontSize: 16),)
                )
              ],
            ),
            SizedBox(height: 20,),

            //customaize part
            BottomPartOfLogin()
          ],
        ),
      ),
    );
  }
}