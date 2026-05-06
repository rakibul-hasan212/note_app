import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:firebase_project/widgets/DateTimeFormat/formate_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class noteBody extends StatelessWidget {
  noteBody({super.key});

  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() {
      var note = noteController.filteredNotes;
      if (note.isEmpty) {
        return Center(
          child: Text("No Notes available"),
        );
      }
      return ListView.builder(
          itemCount: note.length,
          itemBuilder: (context, index) {
            var noteItem = note[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title,Pinned, Editbutton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            noteItem.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                      //Pinned button
                      IconButton(
                        onPressed: () {
                          noteController.togglePinned(noteItem);
                        },
                        icon: noteItem.isPinned
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                        color: noteItem.isPinned
                            ? Colors.deepOrange
                            : Colors.grey,
                      ),
                      //Edit option button
                      IconButton(
                          onPressed: () {
                            Get.to(() => UpdateNotePage(note: noteItem));
                          },
                          icon: Icon(Icons.edit_note_outlined))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  //description or subtitle
                  MarkdownBody(
                      data: noteItem.subTitle
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // CATEGORY TAG + Time + Delete Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // CATEGORY
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          noteItem.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      //Time
                      Expanded(
                        child: Text(
                          noteItem.updatedAt != null
                              ? "Updated ${formatDateTime(noteItem.updatedAt)}"
                              : noteItem.createdAt != null
                              ? "Created ${formatDateTime(noteItem.createdAt)}"
                              : " Savings ...",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      //Delete Note
                      IconButton(
                          onPressed: () async {
                            await noteController.deleteNote(noteItem.id);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  )
                ],
              ),
            );
          });
    }));
  }
}
