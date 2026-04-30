
import 'package:firebase_project/core/routes/app_routes.dart';
import 'package:firebase_project/pages/Home/home_page.dart';
import 'package:firebase_project/pages/add%20note%20page/add_note_page.dart';
import 'package:firebase_project/pages/login/login_page.dart';
import 'package:firebase_project/pages/signup/signup_page.dart';
import 'package:firebase_project/pages/splash/splash_page.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:get/get.dart';

class AppPages{

  static final routes = [
    GetPage(
        name: Routes.Splash,
        page: () => SplashPage()
    ),
    GetPage(
        name: Routes.Login,
        page: ()=> LoginPage()
    ),
    GetPage(
        name: Routes.Signup,
        page: ()=> SignUpPage()
    ),
    GetPage(
        name: Routes.Home,
        page: ()=> HomePage()
    ),
    GetPage(
        name: Routes.AddNote,
        page: ()=> AddNotePage()
    ),
    // GetPage(
    //     name: Routes.UpdateNote,
    //     page: ()=> UpdateNotePage()
    // ),

  ];
}