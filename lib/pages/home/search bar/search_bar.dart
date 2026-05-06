
import 'package:firebase_project/controller/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final searchtextController = TextEditingController();
final noteController = Get.put(NoteController());
class SearchBarDesign extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        controller: searchtextController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: "Search Note....",
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
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
    );
  }

}
