
import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:firebase_project/widgets/DateTimeFormat/formate_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class noteBody extends StatelessWidget{

  noteBody({super.key});

  final NoteController noteController = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(() {
          var note = noteController.filteredNotes;
          if(note.isEmpty){
            return Center(child: Text("No Notes available"),);
          }
          return ListView.builder(
              itemCount: note.length,
              itemBuilder: (context, index){
                var noteItem = note[index];
                return Card(
                  child: ListTile(
                      tileColor: noteItem.isPinned ? Colors.lightGreen[200] : Colors.white,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(noteItem.title),
                          SizedBox(width: 30,),
                          IconButton(
                              onPressed: (){
                                noteController.togglePinned(noteItem);
                              },
                              icon: noteItem.isPinned ? Icon(Icons.favorite, color: Colors.deepOrange,)
                                  : Icon(Icons.favorite_border_outlined, color: Colors.orange,)
                          ),
                          SizedBox(width: 30,),
                          IconButton(
                              onPressed: (){
                                Get.to(()=> UpdateNotePage(note: noteItem));
                              },
                              icon: Icon(Icons.edit_note_outlined))
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteItem.subTitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text(
                                noteItem.updatedAt != null
                                    ? "Updated ${formatDateTime(noteItem.updatedAt)}"
                                    : noteItem.createdAt != null
                                    ? "Created ${formatDateTime(noteItem.createdAt)}"
                                    : " Savings ...",
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(width: 20,),
                              Text("Category: ${noteItem.category}", style: TextStyle(color: Colors.deepOrange),)
                            ],
                          )
                        ],
                      ),

                      trailing: IconButton(
                          onPressed: () async{
                            await noteController.deleteNote(noteItem.id);
                          },
                          icon: Icon(Icons.delete)
                      )
                  ),
                );
              });
        })
    );
  }

}