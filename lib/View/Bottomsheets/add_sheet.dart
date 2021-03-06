// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/Bottomsheets/add_note_sheet.dart';
import 'package:project_tasker/View/Bottomsheets/add_project_sheet.dart';
import 'package:project_tasker/View/Bottomsheets/add_task_sheet.dart';

class AddSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddSheetState();
}

class _AddSheetState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.2,
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
                left: width * 0.055, right: width * 0.055, top: height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add",
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.025),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.055, vertical: height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Get.back();
                    _loadDataController.projectList.length > 0
                        ? Get.bottomSheet(AddTaskSheet()).then((value) {
                            //_loadDataController.getTodayTasks();
                            //_loadDataController.getTodayCompletedTasks();
                          })
                        : Get.showSnackbar(GetSnackBar(
                            duration: const Duration(seconds: 5),
                            messageText: Text(
                              "Please add a project before adding tasks.",
                              style: GoogleFonts.poppins(
                                  color: white,
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                          ));
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.28,
                    decoration: BoxDecoration(
                        color: light,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_square,
                            color: primaryColor,
                          ),
                          SizedBox(width: width * 0.015),
                          Text(
                            "Task",
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
                  onPressed: () {
                    Get.back();
                    Get.bottomSheet(AddProjectSheet());
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.28,
                    decoration: BoxDecoration(
                        color: light,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.square_list,
                            color: primaryColor,
                          ),
                          SizedBox(width: width * 0.015),
                          Text(
                            "Project",
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
                  onPressed: () {
                    Get.back();
                    Get.bottomSheet(AddNoteSheet());
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.28,
                    decoration: BoxDecoration(
                        color: light,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.pencil_ellipsis_rectangle,
                            color: primaryColor,
                          ),
                          SizedBox(width: width * 0.015),
                          Text(
                            "Note",
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
      ),
    );
  }
}
