import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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

  //for category selection
  var selectedCategory = 'All'.obs;

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
  Future<void> addNote(String title, String subTitle, String category) async {
    try{
      //loading state
      isLoading.value = true;
      String id = noteRef.doc().id; // unique ID generate
      await noteRef.doc(id).set({
        //form user
        'title': title,
        'subTitle': subTitle,
        'category': category,
        //by default set
        'isPinned': false,
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
  //togglePinned
  Future<void> togglePinned(NoteModel note) async{
    try{
      await noteRef.doc(note.id).update({
        'isPinned': !note.isPinned
      });
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
  }
  // Search NOTES (Search Logic)
  List<NoteModel> get filteredNotes {

    List<NoteModel> list = noteList;

    // search with the search text, it can be title or subTitle text
    if(searchText.value.isNotEmpty){
      list = list.where((note){
        final query = searchText.value.toLowerCase();
        return note.title.toLowerCase().contains(query) || note.subTitle.toLowerCase().contains(query);
      }).toList();
    }
    //category filter
    if (selectedCategory.value != "All") {
      list = list.where((note) {
        return note.category == selectedCategory.value;
      }).toList();
    }

    //sorting with respect to pinned or not
    list.sort((a, b){
      if(a.isPinned != b.isPinned){
        return a.isPinned ? -1 : 1 ; // if the note is pinned show in up others wise show in bellow
      }

      //  step 2 → latest time first
      // check when the notes are updated or created
      final aTime = a.updatedAt ?? a.createdAt;
      final bTime = b.updatedAt ?? b.createdAt;
      // null safety
      if (aTime == null || bTime == null) return 0;

      // latest top
      return bTime.compareTo(aTime);
    });
    // If search is empty → full list show with sort
    return list;
  }

}