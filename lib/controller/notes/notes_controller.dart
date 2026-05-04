
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../model/note_model.dart';
import '../auth/auth_controller.dart';

class NoteController extends GetxController {

  //initialize the firestore to store date
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //loading state
  final RxBool isLoading = false.obs;
  //for search
  var searchText = ''.obs;
  // AuthController access
  final AuthController authController = Get.put(AuthController());

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
    try{
      //loading state
      isLoading.value = true;
      String id = noteRef.doc().id; // unique ID generate
      await noteRef.doc(id).set({
        'title': title,
        'subTitle': subTitle,
        'createdAt': FieldValue.serverTimestamp()
      });
    }catch(e){
      Get.snackbar("Error", e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  //update notes method
  Future<void> updateNote(NoteModel note) async {
    try{
      //loading state
      isLoading.value = true;
      await noteRef.doc(note.id).update({
        'title': note.title,
        'subTitle': note.subTitle,
        'updatedAt': FieldValue.serverTimestamp()
      });
    }catch(e){
      Get.snackbar('Error', e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  //delete the notes
  Future<void> deleteNote(String id) async {
    try{
      await noteRef.doc(id).delete();
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
  }

  // Search NOTES (Search Logic)
  List<NoteModel> get filteredNotes {

    // If search is empty → full list show
    if (searchText.value.isEmpty) {
      return noteList;
    }
    // search with the search text, it can be title or subTitle text
    return noteList.where((note) {
      final title = note.title.toLowerCase();
      final subTitle = note.subTitle.toLowerCase();
      final query = searchText.value.toLowerCase();
      // if title or subtitle match then show it
      return title.contains(query) || subTitle.contains(query);
    }).toList();
  }

}