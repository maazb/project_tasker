import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/Model/note.dart';
import 'package:project_tasker/Model/project.dart';

class LoadDataController extends GetxController {
  RxList<Note> noteList = RxList<Note>();
  RxList<Project> projectList = RxList<Project>();
  RxList<Color> colorList = RxList<Color>();

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
    colorList.add(violet);
    colorList.add(skin);
    colorList.add(pink);
  }

  Color getColor(int i) {
    return colorList[i];
  }

  Future<void> getProjects() async {
    projectList.add(
        Project(projectName: "Project 1", projectAvatar: 2, projectColor: 3));
    projectList.add(
        Project(projectName: "Project 2", projectAvatar: 3, projectColor: 2));
    projectList.add(
        Project(projectName: "Project 3", projectAvatar: 3, projectColor: 1));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
