import 'package:flutter/cupertino.dart';
import 'package:project_tasker/Model/task.dart';

class Project {
  String? projectName;
  int? projectColor;
  int? projectAvatar;
  List<Task> tasks = List.empty();

  Project({
    this.projectName,
    this.projectColor,
    this.projectAvatar,
  });
}
