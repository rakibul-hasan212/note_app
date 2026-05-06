
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/core/routes/app_pages.dart';
import 'package:firebase_project/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/colors/app_colors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        scaffoldBackgroundColor:  AppColors.backgroundPrimary,//Colors.grey.shade100, //Color(0xFFC5DADE),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundDark,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: Routes.Splash,
      getPages: AppPages.routes,
    );
  }

}