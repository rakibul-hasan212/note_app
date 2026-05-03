

import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget{
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  const LoginFormWidget({
    super.key,
    required this.email,
    required this.password,
    required this.formKey
});
  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }


}