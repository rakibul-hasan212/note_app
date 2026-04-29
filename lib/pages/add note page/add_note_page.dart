
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/add_note_controller.dart';

class AddNotePage extends StatelessWidget{
  AddNotePage({super.key});
  final controller = Get.put(AddNoteController());
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text("Add Note",style: TextStyle(color: AppColors.textPrimary,fontSize: 28,fontWeight: FontWeight.w800)),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: isloading ? Center(child: CircularProgressIndicator()): Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.titleController.value,
              decoration: InputDecoration(
                hintText: "Enter the Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: controller.subTitleController.value,
              decoration: InputDecoration(
                  hintText: "Description...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                hintMaxLines: 4
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () async{
              await controller.addNotesFirestore(controller.titleController.value.text, controller.subTitleController.value.text);
              controller.titleController.value.clear();
              controller.subTitleController.value.clear();
              isloading = true;
              Navigator.pop(context);
            }, child: Text("Submit",style: TextStyle(color: AppColors.buttonPrimary),))
          ],
        ),
      ),
    );
  }

}