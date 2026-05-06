import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/model/note_model.dart';
import 'package:firebase_project/widgets/Note%20widget/note_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/app_colors.dart';

class UpdateNotePage extends StatelessWidget {
  final NoteModel note;

  UpdateNotePage({super.key, required this.note});

  late final title = TextEditingController(text: note.title);
  late final subTitle = TextEditingController(text: note.subTitle);
  final NoteController noteCntrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Note Update",
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w800)),
          centerTitle: true,
          toolbarHeight: 60,
        ),
        body: Obx(() {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: NoteWidgets(
                titleCntlr: title,
                subTitleCntlr: subTitle,
                buttonText: "Update Note",
                onSubmit: () async {
                  NoteModel updateNote = NoteModel(
                      id: note.id, title: title.text, subTitle: subTitle.text);
                  await noteCntrl.updateNote(updateNote);
                  Get.back();
                },
                isLoading: noteCntrl.isLoading.value,
              ),
            ),
          );
        })
    );
  }
}
