// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Components/bottom_navigation.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/Bottomsheets/edit_note_sheet.dart';

import 'package:project_tasker/View/notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToDo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getToDo() async {
    await _loadDataController.getTodayTasks();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        foregroundColor: textColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: white,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: height * 0.1,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.02),
          width: width,
          height: height * 0.1,
          //color: violet,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Hello, Mary",
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.033),
                ),
              ),
              CupertinoButton(
                minSize: width * 0.001,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Get.to(() => Notifications());
                },
                child: Container(
                    child: Stack(
                  children: [
                    Icon(
                      CupertinoIcons.bell,
                      color: textColor,
                    ),
                    Positioned(
                        right: width * 0.00,
                        top: height * 0.00,
                        child: Container(
                          height: width * 0.018,
                          width: width * 0.018,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(width * 5)),
                        ))
                  ],
                )),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.055, vertical: height * 0.02),
                height: height * 0.18,
                width: width,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(width * 0.06)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: height * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              "Today",
                              style: GoogleFonts.poppins(
                                  color: white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.022),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                _loadDataController.completedTodayTasks.value
                                        .toString() +
                                    "/" +
                                    _loadDataController.todayTaskList.length
                                        .toString() +
                                    " tasks",
                                style: GoogleFonts.poppins(
                                    color: white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.032),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.0),
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: Image.asset(
                          _loadDataController.selectedHomeAvatar.value,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(
                () => Container(
                  child: _loadDataController.noteList.length == 0
                      ? Container()
                      : Column(
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
                                    "Short Notes",
                                    style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.025),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => Container(
                                  height: height * 0.2,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          _loadDataController.noteList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            index == 0
                                                ? SizedBox(
                                                    width: width * 0.055,
                                                  )
                                                : Container(),
                                            Stack(
                                              children: [
                                                CupertinoButton(
                                                  onPressed: () {
                                                    Get.bottomSheet(
                                                        EditNoteSheet(
                                                      index: index,
                                                      note: _loadDataController
                                                          .noteList[index]
                                                          .content,
                                                    ));
                                                  },
                                                  padding: EdgeInsets.all(0),
                                                  minSize: width * 0.001,
                                                  child: Container(
                                                    height: height * 0.17,
                                                    width: height * 0.17,
                                                    decoration: BoxDecoration(
                                                        color: grey,
                                                        // boxShadow: [
                                                        //   BoxShadow(
                                                        //       offset: Offset(0, 2),
                                                        //       color: grey,
                                                        //       blurRadius: 20),
                                                        // ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.06)),
                                                    child: Container(
                                                      padding: EdgeInsets.all(
                                                          height * 0.015),
                                                      child: Text(
                                                        _loadDataController
                                                            .noteList
                                                            .value[index]
                                                            .content!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    height *
                                                                        0.014),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    right: height * 0.012,
                                                    bottom: height * 0.012,
                                                    child: Container(
                                                      height: height * 0.035,
                                                      width: height * 0.035,
                                                      decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    height * 3),
                                                      ),
                                                      child: CupertinoButton(
                                                        onPressed: () {
                                                          _loadDataController
                                                              .noteList
                                                              .remove(_loadDataController
                                                                      .noteList[
                                                                  index]);
                                                        },
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        minSize: height * 0.035,
                                                        child: Container(
                                                          child: Icon(
                                                            CupertinoIcons
                                                                .trash,
                                                            color: textColor,
                                                            size:
                                                                height * 0.022,
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              width: width * 0.03,
                                            )
                                          ],
                                        );
                                      })),
                            )
                          ],
                        ),
                ),
              ),
              Container(
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
                            "To do",
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.025),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.055),
                        //height: height * 0.2,
                        child: Obx(
                          () => ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  _loadDataController.todayTaskList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    index == 0
                                        ? SizedBox(
                                            height: height * 0.018,
                                          )
                                        : Container(),
                                    CupertinoButton(
                                      onPressed: () {
                                        if (_loadDataController
                                                .todayTaskList[index]
                                                .completed ==
                                            false) {
                                          _loadDataController
                                              .todayTaskList[index]
                                              .completed = true;
                                        } else {
                                          _loadDataController
                                              .todayTaskList[index]
                                              .completed = false;
                                        }

                                        setState(() {});
                                        _loadDataController
                                            .getTodayCompletedTasks();
                                      },
                                      padding: EdgeInsets.all(0),
                                      minSize: width * 0.001,
                                      child: Container(
                                        height: height * 0.1,
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 4),
                                                  color: grey2,
                                                  blurRadius: 15)
                                            ],
                                            borderRadius: BorderRadius.circular(
                                                width * 0.06)),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.02,
                                              horizontal: width * 0.04),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    _loadDataController
                                                        .todayTaskList[index]
                                                        .taskName!,
                                                    style: GoogleFonts.poppins(
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            height * 0.020),
                                                  ),
                                                ),
                                                Obx(
                                                  () => Container(
                                                    padding: EdgeInsets.only(
                                                        right: width * 0.02,
                                                        left: width * 0.04),
                                                    child: Center(
                                                      child: _loadDataController
                                                                  .todayTaskList[
                                                                      index]
                                                                  .completed ==
                                                              true
                                                          ? Container(
                                                              height:
                                                                  width * 0.05,
                                                              width:
                                                                  width * 0.05,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      primaryColor,
                                                                  border: Border.all(
                                                                      color:
                                                                          primaryColor,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width: width *
                                                                          0.0025),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          width *
                                                                              0.015)),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .check_mark,
                                                                color: white,
                                                                size: width *
                                                                    0.03,
                                                              ))
                                                          : Container(
                                                              height:
                                                                  width * 0.05,
                                                              width:
                                                                  width * 0.05,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color:
                                                                          textColor,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width: width *
                                                                          0.0025),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          width *
                                                                              0.015)),
                                                            ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                );
                              }),
                        )),
                    SizedBox(
                      height: height * 0.15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomNavigation(),
      // Container(
      // color: invisible,
      // height: height * 0.15,
      // width: width,
      // child:
    );
  }
}
