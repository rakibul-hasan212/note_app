
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String title;
  String subTitle;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isPinned;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
    this.createdAt,
    this.updatedAt,
    this.isPinned = false
  });

  factory NoteModel.fromMap(Map<String, dynamic> data, String id) {
    return NoteModel(
      id: id,
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      isPinned: data['isPinned'] ?? false,

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
      'isPinned': isPinned
    };
  }
}