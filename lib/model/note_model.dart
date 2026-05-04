
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String title;
  String subTitle;
  DateTime? createdAt;
  DateTime? updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
    this.createdAt,
    this.updatedAt
  });

  factory NoteModel.fromMap(Map<String, dynamic> data, String id) {
    return NoteModel(
      id: id,
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      //Timestamp to convert toDate()
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate() : null,
      updatedAt: data['updatedAt'] != null
          ? (data['updatedAt'] as Timestamp).toDate() : null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
    };
  }
}