// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Components/bottom_navigation.dart';
import 'package:project_tasker/Controller/database.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';

class OpenProject extends StatefulWidget {
  int? projectId;
  OpenProject({Key? key, this.projectId}) : super(key: key);

  @override
  _OpenProjectState createState() => _OpenProjectState();
}

class _OpenProjectState extends State<OpenProject> {
  LoadDataController _loadDataController = Get.find();
  Database _database = Database();
  late double height;
  late double width;
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
          //leadingWidth: width * 0.055,

          leading: CupertinoButton(
            onPressed: () => Get.back(),
            padding: EdgeInsets.all(0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.055),
              child: Icon(
                Icons.arrow_back,
                color: textColor,
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: width * 0.0, right: width * 0.02),
            width: width,
            height: height * 0.1,
            //color: violet,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Expanded(
                    child: Text(
                      _loadDataController
                          .projectList[
                              _loadDataController.selectedProject.value]
                          .projectName!,
                      style: GoogleFonts.poppins(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.033),
                    ),
                  ),
                ),
                Container(
                    //   child: Stack(
                    // children: [
                    //   Icon(
                    //     CupertinoIcons.,
                    //     color: textColor,
                    //   ),
                    //   Positioned(
                    //       right: width * 0.00,
                    //       top: height * 0.00,
                    //       child: Container(
                    //         height: width * 0.018,
                    //         width: width * 0.018,
                    //         decoration: BoxDecoration(
                    //             color: green,
                    //             borderRadius: BorderRadius.circular(width * 5)),
                    //  ))
                    // ],
                    //)
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
                    margin: EdgeInsets.symmetric(horizontal: width * 0.055),
                    //height: height * 0.2,
                    child: Obx(
                      () => ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _loadDataController.taskList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _loadDataController
                                        .taskList[index].projectId !=
                                    widget.projectId
                                ? Container()
                                : Column(
                                    children: [
                                      index == 0
                                          ? SizedBox(
                                              height: height * 0.018,
                                            )
                                          : Container(),
                                      GestureDetector(
                                        onHorizontalDragEnd: (details) {
                                          _loadDataController.taskList.remove(
                                              _loadDataController
                                                  .taskList[index]);

                                          _database.deleteTaskList(
                                              _loadDataController
                                                  .currentUserId.value);
                                          _loadDataController.taskListUpload(
                                              _loadDataController
                                                  .currentUserId.value);
                                        },
                                        child: CupertinoButton(
                                          onPressed: () {
                                            if (_loadDataController
                                                    .taskList[index]
                                                    .completed ==
                                                false) {
                                              _loadDataController
                                                  .taskList[index]
                                                  .completed = true;
                                              _database.deleteTaskList(
                                                  _loadDataController
                                                      .currentUserId.value);

                                              _loadDataController
                                                  .taskListUpload(
                                                      _loadDataController
                                                          .currentUserId.value);

                                              _loadDataController
                                                  .getTodayTotalTasks();

                                              _loadDataController
                                                  .getTodayCompletedTasks();
                                            } else {
                                              _loadDataController
                                                  .taskList[index]
                                                  .completed = false;

                                              _database.deleteTaskList(
                                                  _loadDataController
                                                      .currentUserId.value);

                                              _loadDataController
                                                  .taskListUpload(
                                                      _loadDataController
                                                          .currentUserId.value);

                                              _loadDataController
                                                  .getTodayTotalTasks();

                                              _loadDataController
                                                  .getTodayCompletedTasks();
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
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                                            .taskList[index]
                                                            .taskName!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    height *
                                                                        0.020),
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: width *
                                                                    0.02,
                                                                left: width *
                                                                    0.04),
                                                        child: Center(
                                                          child: _loadDataController
                                                                      .taskList[
                                                                          index]
                                                                      .completed ==
                                                                  true
                                                              ? Container(
                                                                  height: width *
                                                                      0.05,
                                                                  width: width *
                                                                      0.05,
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
                                                                              width * 0.015)),
                                                                  child: Icon(
                                                                    CupertinoIcons
                                                                        .check_mark,
                                                                    color:
                                                                        white,
                                                                    size: width *
                                                                        0.03,
                                                                  ))
                                                              : Container(
                                                                  height:
                                                                      width *
                                                                          0.05,
                                                                  width: width *
                                                                      0.05,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              textColor,
                                                                          style: BorderStyle
                                                                              .solid,
                                                                          width: width *
                                                                              0.0025),
                                                                      borderRadius:
                                                                          BorderRadius.circular(width *
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
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      )
                                    ],
                                  );
                          }),
                    )),
                // Obx(
                //   () => Container(
                //       margin: EdgeInsets.symmetric(horizontal: width * 0.055),
                //       //height: height * 0.2,
                //       child: _loadDataController.taskList.isEmpty
                //           ? Container()
                //           : Obx(
                //               () => ListView.builder(
                //                   scrollDirection: Axis.vertical,
                //                   shrinkWrap: true,
                //                   physics: NeverScrollableScrollPhysics(),
                //                   itemCount:
                //                       _loadDataController.taskList.length,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     return Column(
                //                       children: [
                //                         index == 0
                //                             ? SizedBox(
                //                                 height: height * 0.018,
                //                               )
                //                             : Container(),
                //                         GestureDetector(
                //                           onPanUpdate: (details) {
                //                             // _loadDataController

                //                             //     .taskList
                //                             //     .remove(_loadDataController
                //                             //         .projectList[
                //                             //             _loadDataController
                //                             //                 .selectedProject
                //                             //                 .value]
                //                             //         .taskList[index]);
                //                           },
                //                           child: Container(
                //                             height: height * 0.1,
                //                             width: width,
                //                             decoration: BoxDecoration(
                //                                 color: white,
                //                                 boxShadow: [
                //                                   BoxShadow(
                //                                       offset: Offset(0, 4),
                //                                       color: grey2,
                //                                       blurRadius: 15)
                //                                 ],
                //                                 borderRadius:
                //                                     BorderRadius.circular(
                //                                         width * 0.06)),
                //                             child: Container(
                //                               padding: EdgeInsets.symmetric(
                //                                   vertical: height * 0.02,
                //                                   horizontal: width * 0.04),
                //                               child: Center(
                //                                 child: Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment
                //                                           .spaceBetween,
                //                                   children: [
                //                                     Expanded(
                //                                       child: Text(
                //                                         // _loadDataController
                //                                         //     .projectList[
                //                                         //         _loadDataController
                //                                         //             .selectedProject
                //                                         //             .value]
                //                                         //     .taskList[index]
                //                                         //     .taskName!,
                //                                         _loadDataController
                //                                             .taskList[index]
                //                                             .taskName!,
                //                                         style:
                //                                             GoogleFonts.poppins(
                //                                                 color:
                //                                                     textColor,
                //                                                 fontWeight:
                //                                                     FontWeight
                //                                                         .w400,
                //                                                 fontSize:
                //                                                     height *
                //                                                         0.020),
                //                                       ),
                //                                     ),
                //                                     Container(
                //                                       padding: EdgeInsets.only(
                //                                           right: width * 0.02,
                //                                           left: width * 0.04),
                //                                       child: Center(
                //                                         child: Container(
                //                                           height: width * 0.05,
                //                                           width: width * 0.05,
                //                                           decoration: BoxDecoration(
                //                                               border: Border.all(
                //                                                   color:
                //                                                       textColor,
                //                                                   style:
                //                                                       BorderStyle
                //                                                           .solid,
                //                                                   width: width *
                //                                                       0.0025),
                //                                               borderRadius:
                //                                                   BorderRadius
                //                                                       .circular(
                //                                                           width *
                //                                                               0.015)),
                //                                         ),
                //                                       ),
                //                                     )
                //                                   ],
                //                                 ),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           height: height * 0.02,
                //                         )
                //                       ],
                //                     );
                //                   }),
                //             )),
                // )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomNavigation());
  }
}
