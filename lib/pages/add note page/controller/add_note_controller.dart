import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import'package:get/get.dart';
class AddNoteController extends GetxController{

  final titleController = TextEditingController().obs;
  final subTitleController = TextEditingController().obs;
  GlobalKey<FormState> formkey = GlobalKey();
  final dbRef = FirebaseFirestore.instance.collection('Users');

  addNotesFirestore(String title, String subTitle) async{
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final data = await dbRef.doc(id).set({
      'id': id,
      'title': title,
      'subTitle': subTitle
    });
  }
}