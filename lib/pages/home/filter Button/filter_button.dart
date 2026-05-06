

import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final NoteController controller = Get.put(NoteController());
Widget filterButton(String category) {
  return Obx(() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: ChoiceChip(
      label: Text(category),

      selected: controller.selectedCategory.value == category,
      selectedColor: Colors.indigo,
      backgroundColor: Colors.grey.shade200,

      labelStyle: TextStyle(
        color: controller.selectedCategory.value == category
            ? Colors.white
            : Colors.black,
      ),

      onSelected: (value) {
        controller.selectedCategory.value = category;
      },
    ),
  ));
}