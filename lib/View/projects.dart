import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Components/bottom_navigation.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/open_project.dart';

class Projects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectsState();
}

class _ProjectsState extends State {
  late double height;
  late double width;
  RxBool isSearchOpen = false.obs;
  LoadDataController _loadDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
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
        title: Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            width: width,
            height: height * 0.1,
            //color: violet,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: isSearchOpen.value == false
                      ? Text(
                          "Projects",
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.033),
                        )
                      : Expanded(
                          child: CupertinoSearchTextField(
                            enabled: true,
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018),
                          ),
                        ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    if (isSearchOpen.value == false) {
                      isSearchOpen.value = true;
                    } else {
                      isSearchOpen.value = false;
                    }
                    print(isSearchOpen.value.toString());
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: width * 0.055),
                      child: Stack(
                        children: [
                          isSearchOpen.value == false
                              ? Icon(
                                  CupertinoIcons.search,
                                  color: textColor,
                                )
                              : Icon(
                                  CupertinoIcons.multiply,
                                  color: textColor,
                                ),
                          // Positioned(
                          //     right: width * 0.00,
                          //     top: height * 0.00,
                          //     child: Container(
                          //       height: width * 0.018,
                          //       width: width * 0.018,
                          //       decoration: BoxDecoration(
                          //           color: green,
                          //           borderRadius: BorderRadius.circular(width * 5)),
                          //     ))
                        ],
                      )),
                )
              ],
            ),
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
                        itemCount: _loadDataController.projectList.length,
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
                                  _loadDataController.selectedProject.value =
                                      index;
                                  Get.to(() => OpenProject());
                                },
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: width * 0.055,
                                  //     vertical: height * 0.02),
                                  height: height * 0.18,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: _loadDataController.getColor(
                                          _loadDataController.projectList
                                              .value[index].projectColor!),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.06)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: width * 0.02,
                                              left: width * 0.04,
                                              bottom: height * 0.04,
                                              top: height * 0.03),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "4/10 tasks - ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: textColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: height *
                                                                  0.018),
                                                    ),
                                                    Text(
                                                      "40%",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: textColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: height *
                                                                  0.018),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Flexible(
                                                  child: Text(
                                                    _loadDataController
                                                        .projectList[index]
                                                        .projectName!,
                                                    style: GoogleFonts.poppins(
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            height * 0.025),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: width * 0.35,
                                        width: width * 0.35,
                                        padding: EdgeInsets.all(width * 0.0),
                                        margin: EdgeInsets.only(
                                            top: height * 0.02,
                                            right: width * 0.04),
                                        child: Image.asset(
                                          _loadDataController.getAvatar(
                                              _loadDataController
                                                  .projectList[index]
                                                  .projectAvatar!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomNavigation(),
    );
  }
}
