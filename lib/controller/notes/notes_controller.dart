
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../model/note_model.dart';
import '../auth/auth_controller.dart';

class NoteController extends GetxController {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // AuthController access
  final AuthController authController = Get.find();

  //reactive note list
  var noteList = <NoteModel>[].obs;

  //dynamically current user er note path
  CollectionReference get noteRef =>
      firestore
          .collection('Users')                // root collection
          .doc(authController.userId)         // current user doc
          .collection('Notes');               // subcollection

  @override
  void onInit() {
    super.onInit();
    // realtime listener for current user's notes
    noteRef.snapshots().listen((snapshot) {
      noteList.value = snapshot.docs.map((doc) {
        return NoteModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id, //document ID
        );
      }).toList();
    });
  }

  // add note method to create new note
  Future<void> addNote(String title, String subTitle) async {

    String id = noteRef.doc().id; // unique ID generate

    NoteModel note = NoteModel(
      id: id,
      title: title,
      subTitle: subTitle,
    );

    await noteRef.doc(id).set(note.toMap());
  }

  //update notes method
  Future<void> updateNote(NoteModel note) async {
    await noteRef.doc(note.id).update(note.toMap());
  }

  //delete the notes
  Future<void> deleteNote(String id) async {
    await noteRef.doc(id).delete();
  }
}