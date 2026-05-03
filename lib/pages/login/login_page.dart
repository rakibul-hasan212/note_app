
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/core/routes/app_routes.dart';
import 'package:firebase_project/pages/forget%20password/forget_password_page.dart';
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
      backgroundColor: AppColors.backgroundPrimary,
      body: SingleChildScrollView(
        child: Padding(
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
              Form(
                key: formKey,
                  child: Column(
                    children: [
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
                        validator: (value){
                          if(value == null || value.isEmpty ){
                            return "Email required";
                          }
                          if(!value.contains('@')){
                            return 'Invalid Email';
                          }
                          return null;
                        },
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
                        validator: (value){
                          if(value == null || value.isEmpty){
                              return "Required a password";
                          }
                          if(value.length < 6 ){
                              return "Password length should be at least 6";
                          }
                          return null;
                        },
                      ),
                    ],
              )
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: false,
                          onChanged: (value){
                            //value = true;
                          }),
                      Text("Remember me")
                    ],
                  ),
                  InkWell(
                      onTap: (){
                        Get.to(ForgetPasswordPage());
                        //Navigator.push(context, MaterialPageRoute(builder: (_)=> ForgetPasswordPage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Forget password perform successful")));
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
              Container(
                height: 1,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google action perform successfully")));
                      },
                      child: Icon(Icons.g_mobiledata,size: 32,color: Colors.deepOrange,)),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gmail action perform successfully")));
                      },
                      child: Icon(Icons.mail_outline,size: 32,color: Colors.deepOrange)),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Facebook action perform successfully")));
                      },
                      child: Icon(Icons.facebook_outlined,size: 32,color: Colors.deepOrange))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}