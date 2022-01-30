import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_tasker/Controller/database.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/Model/note.dart';
import 'package:project_tasker/Model/project.dart';
import 'package:project_tasker/Model/task.dart';

class LoadDataController extends GetxController {
  RxList<Note> noteList = RxList<Note>();
  RxList<Project> projectList = RxList<Project>();
  RxList<Task> taskList = RxList<Task>();
  RxList<Color> colorList = RxList<Color>();
  RxList<Color> themeList = RxList<Color>();
  RxList<Task> todayTaskList = RxList<Task>();
  RxInt completedTodayTasks = 0.obs;
  RxInt todayTasks = 0.obs;
  RxBool loading = true.obs;
  RxBool mainLoading = true.obs;
  DateTime focusedCalendarDay = DateTime.now();
  DateTime selectedCalendarDay = DateTime.now();

  RxString currentUserId = "".obs;
  RxString currentUserName = "".obs;
  RxString currentUserEmail = "".obs;

  RxString selectedHomeAvatar = "assets/images/avatar1.png".obs;

  RxInt selectedProject = 0.obs;
  RxInt selectedProjectAddTask = 0.obs;
  RxInt selectedColor = 0.obs;
  RxInt selectedAvatarAddProject = 0.obs;
  RxInt selectedAvatar = 0.obs;
  RxInt selectedColorAddProject = 0.obs;

  Database db = Database();

  Future<void> getTodayTasks() async {
    for (var j = 0; j < taskList.length; j++) {
      if (taskList[j].date!.day == DateTime.now().day) {
        if (todayTaskList.contains(taskList[j]) == false) {
          todayTaskList.add(taskList[j]);
        }
      }
    }
  }

  Future<void> getTodayTotalTasks() async {
    todayTasks.value = 0;
    for (var i = 0; i < taskList.length; i++) {
      if (taskList[i].date!.day == DateTime.now().day) {
        todayTasks.value++;
      }
    }
  }

  Future<void> getTodayCompletedTasks() async {
    completedTodayTasks.value = 0;
    for (var i = 0; i < taskList.length; i++) {
      if (taskList[i].date!.day == DateTime.now().day) {
        if (taskList[i].completed == true) {
          completedTodayTasks.value++;
        }
      }
    }
  }

  Future<void> getNotes(String uid) async {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref('users/$uid/notes/').once();

    print(event.snapshot.value.toString());

    if (event.snapshot.value != null) {
      List<dynamic> sad = event.snapshot.value as List<dynamic>;

      noteList.value = noteListFromJson(sad);
      //print(noteList);
    }
  }

  Future<void> getTasks(String uid) async {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref('users/$uid/tasks/').once();
    print(event.snapshot.value.toString());

    if (event.snapshot.value != null) {
      List<dynamic> sad = event.snapshot.value as List<dynamic>;

      taskList.value = taskListFromJson(sad);
      //print(taskList);
    }
  }

  Future<void> getProjects(String uid) async {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref('users/$uid/projects/').once();
    print(event.snapshot.value.toString());

    if (event.snapshot.value != null) {
      List<dynamic> sad = event.snapshot.value as List<dynamic>;

      projectList.value = projectListFromJson(sad);
      //print(taskList);
    }
  }

  Future<void> noteListUpload(String uid) async {
    for (var i = 0; i < noteList.length; i++) {
      db.saveNote(noteList[i], i, uid);
    }
  }

  Future<void> taskListUpload(String uid) async {
    for (var i = 0; i < taskList.length; i++) {
      db.saveTask(taskList[i], i, uid);
    }
  }

  Future<void> projectListUpload(String uid) async {
    for (var i = 0; i < projectList.length; i++) {
      db.saveProject(projectList[i], i, uid);
    }
  }

  Future<void> addColors() async {
    colorList.add(greenPastel);
    colorList.add(skin);
    colorList.add(pink);
    colorList.add(secondaryColor);
    colorList.add(green);
    colorList.add(bluePastel);
    colorList.add(pinkPastel);
  }

  Future<void> addThemes() async {
    themeList.add(pinkPastel);
    themeList.add(purplePastel);
    themeList.add(greenPastel);
    themeList.add(bluePastel);
  }

  void getTheme(int i) {
    if (i == 0) {
      primaryColor = ferrariRed;
      secondaryColor = pink;
      light = pinkPastel;
    } else if (i == 1) {
      primaryColor = purple;
      secondaryColor = purplePastel;
      light = lightpurple;
    } else if (i == 2) {
      primaryColor = darkGreen;
      secondaryColor = green;
      light = greenPastel;
    } else {
      primaryColor = darkBlue;
      secondaryColor = lightBlue;
      light = bluePastel;
    }
  }

  Color getThemeColor(int i) {
    return themeList[i];
  }

  Color getColor(int i) {
    return colorList[i];
  }

  String getAvatar(int i) {
    if (i == 0) {
      return "assets/images/avatar1.png";
    } else if (i == 1) {
      return "assets/images/avatar2.png";
    } else if (i == 2) {
      return "assets/images/avatar3.png";
    } else if (i == 3) {
      return "assets/images/avatar4.png";
    } else if (i == 4) {
      return "assets/images/avatar5.png";
    } else if (i == 5) {
      return "assets/images/avatar6.png";
    } else if (i == 6) {
      return "assets/images/avatar7.png";
    } else if (i == 7) {
      return "assets/images/avatar8.png";
    } else {
      return "assets/images/avatar1.png";
    }
  }

  // Future<void> getProjects() async {
  //   projectList.add(Project(
  //       projectName: "Course Project", projectAvatar: 4, projectColor: 3));
  //   projectList.add(
  //       Project(projectName: "Assignments", projectAvatar: 3, projectColor: 2));
  //   projectList.add(Project(
  //       projectName: "CV and Job hunt", projectAvatar: 2, projectColor: 1));
  //   projectList.add(Project(
  //       projectName: "Evening Schedule", projectAvatar: 5, projectColor: 4));
  //   projectList.add(Project(
  //       projectName: "Shopping List", projectAvatar: 1, projectColor: 6));
  // }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
