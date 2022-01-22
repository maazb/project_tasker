import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/Model/note.dart';
import 'package:project_tasker/Model/project.dart';
import 'package:project_tasker/Model/task.dart';

class LoadDataController extends GetxController {
  RxList<Note> noteList = RxList<Note>();
  RxList<Project> projectList = RxList<Project>();
  RxList<Color> colorList = RxList<Color>();
  RxList<Color> themeList = RxList<Color>();
  RxList<Task> todayTaskList = RxList<Task>();
  RxInt completedTodayTasks = 0.obs;

  RxString selectedHomeAvatar = "assets/images/avatar1.png".obs;

  RxInt selectedProject = 0.obs;
  RxInt selectedProjectAddTask = 0.obs;
  RxInt selectedColor = 0.obs;
  RxInt selectedAvatarAddProject = 0.obs;
  RxInt selectedAvatar = 0.obs;
  RxInt selectedColorAddProject = 0.obs;

  Future<void> getTodayTasks() async {
    for (var i = 0; i < projectList.length; i++) {
      for (var j = 0; j < projectList[i].tasks.length; j++) {
        if (projectList[i].tasks[j].date!.day == DateTime.now().day) {
          if (todayTaskList.contains(projectList[i].tasks[j]) == false) {
            todayTaskList.add(projectList[i].tasks[j]);
          }
        }
      }
    }
  }

  Future<void> getTodayCompletedTasks() async {
    completedTodayTasks.value = 0;
    for (var i = 0; i < todayTaskList.length; i++) {
      if (todayTaskList[i].completed == true) {
        completedTodayTasks.value++;
      }
    }
  }

  Future<void> getNotes() async {
    noteList.add(Note(
        id: 0,
        content:
            "\"Life is not about how fast you run or how high you climb, but how well you bounce.\" Vivian Komori"));
    noteList.add(Note(
        id: 1,
        content:
            "\"Life is not a problem to be solved, but a reality to be experienced.\" Soren Kierkegaard"));
    noteList.add(Note(
        id: 2,
        content:
            "\"Anyone who stops learning is old, whether at twenty or eighty. Anyone who keeps learning stays young. The greatest thing in life is to keep your mind young.\" Henry Ford"));
    noteList.add(Note(
        id: 3,
        content:
            "\"People grow through experience if they meet life honestly and courageously. This is how character is built.\" Eleanor Roosevelt"));
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

  Future<void> getProjects() async {
    projectList.add(Project(
        projectName: "Course Project", projectAvatar: 4, projectColor: 3));
    projectList.add(
        Project(projectName: "Assignments", projectAvatar: 3, projectColor: 2));
    projectList.add(Project(
        projectName: "CV and Job hunt", projectAvatar: 2, projectColor: 1));
    projectList.add(Project(
        projectName: "Evening Schedule", projectAvatar: 5, projectColor: 4));
    projectList.add(Project(
        projectName: "Shopping List", projectAvatar: 1, projectColor: 6));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
