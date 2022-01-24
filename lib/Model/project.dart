import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Model/task.dart';

List<Project> projectListFromJson(List parsedList) {
  //parsedList.removeWhere((value) => value == null);

  List<Project> newlist = [];

  for (var i = 0; i < parsedList.length; i++) {
    if (parsedList[i] != null) {
      newlist.add(Project.fromJson(parsedList[i]));
    }
  }

  return newlist;

  //return parsedList.map((e) => Note.fromJson(e)).toList();
}

class Project {
  int? projectId;
  String? projectName;
  int? projectColor;
  int? projectAvatar;

  Project({
    this.projectId,
    this.projectName,
    this.projectColor,
    this.projectAvatar,
  });

  factory Project.fromJson(Map<dynamic, dynamic> json) => Project(
      projectId: json["projectId"],
      projectName: json["projectName"],
      projectColor: json["projectColor"],
      projectAvatar: json["projectAvatar"]);

  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //       'id': id,
  //       'content': content,
  //     };
}
