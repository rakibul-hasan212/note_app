
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String title;
  String subTitle;
  DateTime? createdAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
    this.createdAt
  });

  factory NoteModel.fromMap(Map<String, dynamic> data, String id) {
    return NoteModel(
      id: id,
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      //convert toDate()
      createdAt: data['createdAt'] != null ? (data['createdAt'] as Timestamp).toDate() : null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'createdAt': createdAt
    };
  }
}