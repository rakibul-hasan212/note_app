import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/core/colors/app_colors.dart';
import 'package:firebase_project/pages/update/update_note_page.dart';
import 'package:flutter/material.dart';

import '../Add note page/add_note_page.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});

  final dbRef = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text("Note Book",style: TextStyle(color: AppColors.textPrimary,fontSize: 28,fontWeight: FontWeight.w800),),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: StreamBuilder(
          stream: dbRef.snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Center(child: Text("Something is Wrong"));
            }
            if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
              return Center(child: Text("No Notes available"));
            }
            //store the firebase response
            var docs = snapshot.data!.docs;
            List<Map<String,dynamic>> users = [];
            for(var doc in docs){ // convert the response in List
              var data = doc.data() as Map<String, dynamic>;
              data['id'] = doc.id;
              users.add(data);
            }

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> UpdateNotePage(user: user)));
                      },
                      title: Text(user['title'] ?? ' '),
                      subtitle: Text(user['subTitle'] ?? ' '),
                      trailing: IconButton(
                          onPressed: () async {
                            await dbRef.doc(user['id']).delete();
                          }, icon: Icon(Icons.delete)),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await Navigator.push(context,
                MaterialPageRoute(builder: (_)=> AddNotePage()));
          }, child: Icon(Icons.add),
      ),
    );
  }
}