
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget{
  ForgetPasswordPage({super.key});
  TextEditingController emailCont = TextEditingController();
  final AuthController authController = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailCont,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your register email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      prefixIcon: Icon(Icons.email_outlined)
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Give the email";
                      }
                      if(!value.contains("@")){
                        return "Give the register email accurately";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Obx(() {
              return ElevatedButton(
                  onPressed: authController.loading.value ? null : () async{
                    if(formKey.currentState!.validate()){
                      await authController.resetPassword(emailCont.text);
                    }
                  },
                  child: authController.loading.value ? Center(child: CircularProgressIndicator(),)
                      : Text("Reset Password")
              );
            })
          ],
        ),
      ),
    );
  }
}