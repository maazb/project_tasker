import 'package:flutter/material.dart';

class Task {
  int? taskId;
  String? taskName;
  DateTime? date;
  TimeOfDay? time;

  Task({this.taskId, this.taskName, this.date, this.time});
}
