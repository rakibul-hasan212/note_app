
import 'package:firebase_project/controller/auth/auth_controller.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/pages/home/note%20body/note_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Add note page/add_note_page.dart';
import 'filter Button/filter_button.dart';
import 'search bar/search_bar.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});

  final AuthController authCntlr = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColors.backgroundDark,
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
            //searchbar
            SearchBarDesign(),
            SizedBox(height: 10,),
            //category button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                filterButton("All"),
                filterButton("Study"),
                filterButton("Personal"),
                filterButton("Work"),
              ],
            ),
            SizedBox(height: 10,),
            //notes
            noteBody()
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
