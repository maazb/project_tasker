// ignore_for_file: file_names
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Controller/database.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/Model/task.dart';
import 'package:project_tasker/View/Bottomsheets/select_project.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();
  TextEditingController _textEditingController = TextEditingController();
  Database _database = Database();
  DateTime selectedDate = DateTime.now();
  RxString sdate = (DateTime.now().day.toString() +
          " / " +
          DateTime.now().month.toString() +
          " / " +
          DateTime.now().year.toString())
      .obs;

  DateTime selectedTime = DateTime.now();
  RxString stime = (TimeOfDay.now().hour.toString() +
          " : " +
          TimeOfDay.now().minute.toString())
      .obs;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          height: height * 0.47,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.06),
                topRight: Radius.circular(width * 0.06)),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.055,
                    right: width * 0.055,
                    top: height * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add task",
                      style: GoogleFonts.poppins(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.025),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: height * 0.07,
                    width: width,
                    margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                        width * 0.055, height * 0.005),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.04),
                        height: height * 0.1,
                        width: width * 0.5,
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Task name..."),
                          cursorColor: primaryColor,
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018),
                          enabled: true,
                          maxLines: 1,
                        )),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Get.bottomSheet(SelectProjectSheet());
                    },
                    padding: EdgeInsets.all(0),
                    minSize: width * 0.001,
                    child: Container(
                      height: height * 0.07,
                      width: width,
                      margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                          width * 0.055, height * 0.005),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.04),
                          height: height * 0.07,
                          width: width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  _loadDataController
                                      .projectList[_loadDataController
                                          .selectedProjectAddTask.value]
                                      .projectName!,
                                  style: GoogleFonts.poppins(
                                      color: textLight,
                                      fontWeight: FontWeight.w400,
                                      fontSize: height * 0.018),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.forward,
                                color: textLight,
                              )
                            ],
                          )),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () async {
                      selectedDate = (await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365))))!;

                      sdate.value = selectedDate.day.toString() +
                          " / " +
                          selectedDate.month.toString() +
                          " / " +
                          selectedDate.year.toString();
                    },
                    padding: EdgeInsets.all(0),
                    minSize: width * 0.001,
                    child: Container(
                      height: height * 0.07,
                      width: width,
                      margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                          width * 0.055, height * 0.005),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.04),
                          height: height * 0.07,
                          width: width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  "Date :    " + sdate.value,
                                  style: GoogleFonts.poppins(
                                      color: textLight,
                                      fontWeight: FontWeight.w400,
                                      fontSize: height * 0.018),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.forward,
                                color: textLight,
                              )
                            ],
                          )),
                    ),
                  ),
                  // CupertinoButton(
                  //   onPressed: () async {
                  //     selectedTime = (await showTimePicker(
                  //         context: context, initialTime: TimeOfDay.now()))!;

                  //     stime.value = (selectedTime.hour.toString() +
                  //         " : " +
                  //         selectedTime.minute.toString());
                  //   },
                  //   padding: EdgeInsets.all(0),
                  //   minSize: width * 0.001,
                  //   child: Container(
                  //     height: height * 0.07,
                  //     width: width,
                  //     margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                  //         width * 0.055, height * 0.005),
                  //     decoration: BoxDecoration(
                  //       color: grey,
                  //       borderRadius: BorderRadius.circular(width * 0.03),
                  //     ),
                  //     child: Container(
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: height * 0.01,
                  //             horizontal: width * 0.04),
                  //         height: height * 0.07,
                  //         width: width * 0.5,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Obx(
                  //               () => Text(
                  //                 "Time :    " + stime.value,
                  //                 style: GoogleFonts.poppins(
                  //                     color: textLight,
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: height * 0.018),
                  //               ),
                  //             ),
                  //             Icon(
                  //               CupertinoIcons.forward,
                  //               color: textLight,
                  //             )
                  //           ],
                  //         )),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.055, vertical: height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => Get.back(),
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.42,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   CupertinoIcons.checkmark_square,
                                  //   color: violet,
                                  // ),
                                  // SizedBox(width: width * 0.015),
                                  Text(
                                    "Discard",
                                    style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.022),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () async {
                            if (_textEditingController.text.isEmpty == false) {
                              try {
                                print('checking internet');

                                final result =
                                    await InternetAddress.lookup("example.com");
                                print('checked internet');
                                if (result.isNotEmpty &&
                                    result[0].rawAddress.isNotEmpty) {
                                  _loadDataController.taskList.add(Task(
                                      date: selectedDate,
                                      taskId:
                                          _loadDataController.taskList.length,
                                      taskName: _textEditingController.text,
                                      projectId: _loadDataController
                                          .selectedProjectAddTask.value,
                                      completed: false));

                                  _database.deleteTaskList(
                                      _loadDataController.currentUserId.value);

                                  _loadDataController.taskListUpload(
                                      _loadDataController.currentUserId.value);

                                  _loadDataController.getTodayTasks();
                                  _loadDataController.getTodayCompletedTasks();

                                  Get.back();
                                } else {
                                  print('WIFI ON NO INTERNET');
                                  Get.showSnackbar(GetSnackBar(
                                    duration: Duration(seconds: 5),
                                    messageText: Text(
                                      'No internet connection. Please check your internet connection and try again.',
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ));
                                }
                              } on SocketException catch (e) {
                                Get.showSnackbar(GetSnackBar(
                                  duration: Duration(seconds: 5),
                                  messageText: Text(
                                    'No internet connection. Please check your internet connection and try again.',
                                    style: GoogleFonts.poppins(
                                        color: white,
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ));
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                duration: Duration(seconds: 5),
                                messageText: Text(
                                  'Please add a name of the task',
                                  style: GoogleFonts.poppins(
                                      color: white,
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.w400),
                                ),
                              ));
                            }
                          },
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.42,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   CupertinoIcons.pencil_ellipsis_rectangle,
                                  //   color: violet,
                                  // ),
                                  // SizedBox(width: width * 0.015),
                                  Text(
                                    "Add",
                                    style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.022),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
