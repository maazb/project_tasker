import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Model/note.dart';

class NoteDao {
  void saveNote(Note note, String uid) {
    FirebaseDatabase.instance
        .ref('users/$uid/notes')
        .set({"id": note.id, "content": note.content});
  }
}
