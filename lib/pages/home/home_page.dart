
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:firebase_project/widgets/DateTimeFormat/formate_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Add note page/add_note_page.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});
  final AuthController authCntlr = Get.put(AuthController());
  final NoteController noteController = Get.put(NoteController());
  final searchtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text("My Notes",style: TextStyle(color: AppColors.textPrimary,fontSize: 28,fontWeight: FontWeight.w800),),
        centerTitle: true,
        toolbarHeight: 60,
        actions: [
          IconButton( 
              onPressed: (){}, 
              icon: Icon(Icons.search_outlined,size: 28, color: Colors.white,)
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap:(){
                  authCntlr.logout();
                },  
                child: Icon(Icons.logout_outlined,size: 28, color: Colors.white,)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchtextController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                hintText: "Search Note",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                suffixIcon: IconButton(
                    onPressed: (){
                      searchtextController.clear();
                      noteController.searchText.value = '';
                    },
                    icon: Icon(Icons.clear_outlined)
                )
              ),
              onChanged: (value){
                noteController.searchText.value = value;
              },
            ),
            SizedBox(height: 10,),
            Expanded(
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
                                Text(
                                  noteItem.updatedAt != null
                                      ? "Updated ${formatDateTime(noteItem.updatedAt)}"
                                      : noteItem.createdAt != null
                                          ? "Created ${formatDateTime(noteItem.createdAt)}"
                                          : " Savings ...",
                                  style: TextStyle(color: Colors.red),)
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
            )

          ],

        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            //Update Later
            await Navigator.push(context,
                MaterialPageRoute(builder: (_)=> AddNotePage()));
          }, child: Icon(Icons.add),
      ),
    );
  }
}
