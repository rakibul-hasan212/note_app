

import 'package:flutter/material.dart';
import 'package:get/get.dart';

SuccessSnackBar(String title){
  Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: "$title Successfully done",
        margin: EdgeInsets.all(20),
        borderRadius: 20,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
      )
  );
}