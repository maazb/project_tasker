// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Controller/database.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/Model/note.dart';
import 'package:project_tasker/data/note_dao.dart';

class AddNoteSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNoteSheetState();
}

class _AddNoteSheetState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();
  TextEditingController _textEditingController = TextEditingController();
  Database _database = Database();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          height: height * 0.5,
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
                      "Add note",
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
                    height: height * 0.3,
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
                              hintText: "Write here..."),
                          cursorColor: primaryColor,
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018),
                          enabled: true,
                          maxLines: 7,
                        )),
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
                            try {
                              print('checking internet');

                              final result =
                                  await InternetAddress.lookup("example.com");
                              print('checked internet');
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                // _database.saveNote(
                                //     Note(
                                //         id: _loadDataController.noteList.length,
                                //         content: _textEditingController.text),
                                //     _loadDataController.currentUserId.value);
                                _loadDataController.noteList.add(Note(
                                    id: _loadDataController.noteList.length,
                                    content: _textEditingController.text));

                                _database.deleteNoteList(
                                    _loadDataController.currentUserId.value);

                                _loadDataController.noteListUpload(
                                    _loadDataController.currentUserId.value);

                                //print(_loadDataController.noteList.value.toString());

                                // _database.saveNoteLimit(
                                //     _loadDataController.noteList.length,
                                //     _loadDataController.currentUserId.value);
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
