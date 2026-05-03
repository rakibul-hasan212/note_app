
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Add note page/add_note_page.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});
  final AuthController authCntlr = Get.put(AuthController());
  final NoteController noteController = Get.put(NoteController());

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Search Note",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
                onChanged: (value){
                  //update later
                },
              ),
          ),

          Expanded(
              child: Obx(() {
                var note = noteController.noteList;

                if(note.isEmpty){
                  return Center(child: Text("No Notes available"),);
                }
                return ListView.builder(
                    itemCount: note.length,
                    itemBuilder: (context, index){
                      var noteItem = note[index];
                      return Card(
                        child: ListTile(
                          onTap: (){
                            Get.to(()=> UpdateNotePage(note: noteItem));
                          },
                          title: Text(noteItem.title),
                          subtitle: Text(noteItem.subTitle),
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
