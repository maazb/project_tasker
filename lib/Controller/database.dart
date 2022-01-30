import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Model/note.dart';
import 'package:project_tasker/Model/project.dart';
import 'package:project_tasker/Model/task.dart';

class Database {
  void saveNote(Note note, int i, String uid) async {
    await FirebaseDatabase.instance
        .ref('users/$uid/notes/${i.toString()}')
        .set({"id": i, "content": note.content});

    //Map<dynamic, dynamic> _map = jsonDecode(_de.snapshot.value.toString());

    //print(jsonDecode(_map.values.elementAt(0)));
  }

  void saveProject(Project project, int i, String uid) {
    FirebaseDatabase.instance.ref('users/$uid/projects/${i.toString()}').set({
      "projectId": i,
      "projectName": project.projectName,
      "projectColor": project.projectColor,
      "projectAvatar": project.projectAvatar,
    });
  }

  void saveTask(Task task, int i, String uid) {
    FirebaseDatabase.instance.ref('users/$uid/tasks/${i.toString()}').set({
      "taskId": i,
      "taskName": task.taskName,
      "projectId": task.projectId,
      "date": task.date.toString(),
      "completed": task.completed.toString()
    });
  }

  // void deleteNote(int noteId, String uid) async {
  //   await FirebaseDatabase.instance.ref('users/$uid/notes/$noteId').remove();
  // }

  void deleteNoteList(String uid) async {
    await FirebaseDatabase.instance.ref('users/$uid/notes').remove();
  }

  void deleteTaskList(String uid) async {
    await FirebaseDatabase.instance.ref('users/$uid/tasks').remove();
  }

  void deleteProjectList(String uid) async {
    await FirebaseDatabase.instance.ref('users/$uid/projects').remove();
  }

  // void notesUpdater(int id, int limit, String uid,
  //     LoadDataController _loadDataController) async {
  //   for (var i = id; i < limit + 1; i++) {
  //     if (i != limit) {
  //       await FirebaseDatabase.instance
  //           .ref('users/$uid/notes/$i')
  //           .set(_loadDataController.noteList[i + 1]);
  //     } else {
  //       await FirebaseDatabase.instance.ref('users/$uid/notes/$i').remove();
  //     }
  //   }
  // }

  void saveTheme(int i, String uid) async {
    await FirebaseDatabase.instance.ref('users/$uid/theme').set({"theme": i});
  }

  Future<int> getTheme(String uid) async {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref('users/$uid/theme').once();
    if (event != null) {
      Map<dynamic, dynamic> map = event.snapshot.value as Map<dynamic, dynamic>;
      return map.values.elementAt(0);
    } else {
      return 1;
    }
  }

  void saveAvatar(int i, String uid) async {
    await FirebaseDatabase.instance.ref('users/$uid/avatar').set({"avatar": i});
  }

  Future<int> getAvatar(String uid) async {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref('users/$uid/avatar').once();
    if (event != null) {
      Map<dynamic, dynamic> map = event.snapshot.value as Map<dynamic, dynamic>;
      return map.values.elementAt(0);
    } else {
      return 0;
    }
  }

  // Future<void> getNote(int noteId, String uid) async {
  //   DatabaseEvent event =
  //       await FirebaseDatabase.instance.ref('users/$uid/notes/').once();

  //   print(event.snapshot.value.toString());

  //   if (event.snapshot.value != null) {}
  //   // final json = event.snapshot.value as Map<dynamic, dynamic>;
  //   // Note note = Note.fromJson(json);

  //   //return note;
  // }

}
