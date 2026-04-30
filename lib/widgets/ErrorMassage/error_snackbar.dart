

import 'package:flutter/material.dart';
import 'package:get/get.dart';

ErrorSnackBar(String massage){
  Get.showSnackbar(
    GetSnackBar(
      title: "Error",
      message: massage,
      margin: EdgeInsets.all(20),
      borderRadius: 20,
      duration: Duration(seconds: 5),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
    )
  );
}