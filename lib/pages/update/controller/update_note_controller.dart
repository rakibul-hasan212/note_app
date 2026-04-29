
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNoteController extends GetxController{
  final dbRef  = FirebaseFirestore.instance.collection('Users');

  final title = TextEditingController().obs;
  final subTitle = TextEditingController().obs;

  updateNote(String Id, String title, String subTitle) async{
    final data = await dbRef.doc(Id).update({
      'title': title,
      'subTitle': subTitle
    });
  }
}