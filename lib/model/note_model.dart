
class NoteModel {
  String id;
  String title;
  String subTitle;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  factory NoteModel.fromMap(Map<String, dynamic> data, String id) {
    return NoteModel(
      id: id,
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
    };
  }
}