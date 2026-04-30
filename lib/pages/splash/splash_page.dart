
import 'package:firebase_project/pages/splash/splash_services.dart';
import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startApp(); //After completing the login and signup auth then comment out this method
    // Timer(Duration(seconds: 2), (){
    //   Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage()));
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.note_alt_outlined),
          ),
          SizedBox(height: 10,),
          Text("Note App", style: TextStyle(color: AppColors.textPrimary,fontWeight: FontWeight.w900,fontSize: 32),),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16)
                ),
              ),
              SizedBox(width: 2,),
              Container(
                height: 3,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
              SizedBox(width: 2,),
              Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          CircularProgressIndicator(),
        ],
      ),

    );
  }
}