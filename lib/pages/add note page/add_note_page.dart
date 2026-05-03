
import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/widgets/Note%20widget/note_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddNotePage extends StatelessWidget{
  AddNotePage({super.key});
  final noteCntlr = Get.put(NoteController());
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: NoteWidgets(

            titleCntlr: titleController,

            subTitleCntlr: subTitleController,

            buttonText: "Add Note",

            onSubmit: () async{
              if(titleController.text.isEmpty){
                Get.snackbar("Error", "Title Required");
                return;
              }
              await noteCntlr.addNote(titleController.text, subTitleController.text);
              Get.back();
            }
        )
      ),
    );
  }

}