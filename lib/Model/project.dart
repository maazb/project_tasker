import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Model/task.dart';

class Project {
  String? projectName;
  int? projectColor;
  int? projectAvatar;
  RxList<Task> tasks = RxList<Task>();

  Project({
    this.projectName,
    this.projectColor,
    this.projectAvatar,
  });
}
