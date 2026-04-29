
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/pages/update/controller/update_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/app_colors.dart';

class UpdateNotePage extends StatefulWidget{
  final Map<String, dynamic> user;
  UpdateNotePage({super.key, required this.user});

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  final updateController = Get.put(UpdateNoteController());

  @override
  void initState() {
    updateController.title.value.text = widget.user['title'];
    updateController.subTitle.value.text = widget.user['subTitle'];
    super.initState();
  }
  @override
  void dispose() {
    updateController;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text("Update Note",style: TextStyle(color: AppColors.textPrimary,fontSize: 28,fontWeight: FontWeight.w800)),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: updateController.title.value,
              decoration: InputDecoration(
                  hintText: "Enter the Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: updateController.subTitle.value,
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
              await updateController.updateNote(widget.user['id'], updateController.title.value.text, updateController.subTitle.value.text);
              Navigator.pop(context);
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}