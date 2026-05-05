

import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final NoteController controller = Get.find();
Widget filterButton(String category) {
  return Obx(() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: ChoiceChip(
      label: Text(category),

      selected: controller.selectedCategory.value == category,

      onSelected: (value) {
        controller.selectedCategory.value = category;
      },
    ),
  ));
}