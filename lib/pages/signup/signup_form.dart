
import 'package:flutter/material.dart';

class SignupFormWidget extends StatelessWidget{

  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formkey;
  SignupFormWidget({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
    required this.formkey
  });
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
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
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Required email";
                }
                if(!value.contains("@")){
                  return "Required accurate format of Email";
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
                  return "Required password";
                }
                if(value.length < 6 ){
                  return " Password Length should at least 6";
                }
                return null;
              },
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
    );
  }


}