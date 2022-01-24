import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<Task> taskListFromJson(List parsedList) {
  //parsedList.removeWhere((value) => value == null);

  List<Task> newlist = [];

  for (var i = 0; i < parsedList.length; i++) {
    if (parsedList[i] != null) {
      newlist.add(Task.fromJson(parsedList[i]));
    }
  }

  return newlist;

  //return parsedList.map((e) => Note.fromJson(e)).toList();
}

class Task {
  int? taskId;
  int? projectId;
  String? taskName;
  DateTime? date;
  //DateTime? time;
  bool? completed = false;

  bool parseBool(String s) {
    if (s.toLowerCase() == 'true') {
      return true;
    } else if (s.toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }

  Task({this.taskId, this.projectId, this.taskName, this.date, this.completed});

  factory Task.fromJson(Map<dynamic, dynamic> json) => Task(
      taskId: json["taskId"],
      projectId: json["projectName"],
      taskName: json["taskName"],
      date: DateTime.parse(json["date"] as String),
      completed: json["completed"] as String == "true" ? true : false);
}
