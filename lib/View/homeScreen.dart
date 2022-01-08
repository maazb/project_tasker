// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Components/bottomNavigation.dart';
import 'package:project_tasker/Helper/values.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
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
              Container(
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
              ))
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
                    color: violet,
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
                          Container(
                            child: Text(
                              "2/10 tasks",
                              style: GoogleFonts.poppins(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.032),
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
                          "assets/images/avatar1.png",
                        ),
                      ),
                    )
                  ],
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
                            "Short Notes",
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.025),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: height * 0.2,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  index == 0
                                      ? SizedBox(
                                          width: width * 0.055,
                                        )
                                      : Container(),
                                  Stack(
                                    children: [
                                      Container(
                                        height: height * 0.17,
                                        width: height * 0.17,
                                        decoration: BoxDecoration(
                                            color: grey,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 2),
                                                  color: grey,
                                                  blurRadius: 20),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                                width * 0.06)),
                                        child: Container(
                                          padding:
                                              EdgeInsets.all(height * 0.015),
                                          child: Text(
                                            "Short Notes are a way to write small thoughts down, you can jot down quick notes here.",
                                            style: GoogleFonts.poppins(
                                                color: textColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014),
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
                                                  BorderRadius.circular(
                                                      height * 3),
                                            ),
                                            child: CupertinoButton(
                                              onPressed: () {},
                                              padding: EdgeInsets.all(0),
                                              minSize: height * 0.035,
                                              child: Container(
                                                child: Icon(
                                                  Icons.edit,
                                                  color: textColor,
                                                  size: height * 0.022,
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
                            }))
                  ],
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
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  index == 0
                                      ? SizedBox(
                                          height: height * 0.018,
                                        )
                                      : Container(),
                                  Container(
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Do a 10 mile walk in the morning and eat healthy breakfast.",
                                                style: GoogleFonts.poppins(
                                                    color: textColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: height * 0.020),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: width * 0.02,
                                                  left: width * 0.04),
                                              child: Center(
                                                child: Container(
                                                  height: width * 0.05,
                                                  width: width * 0.05,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: textColor,
                                                          style:
                                                              BorderStyle.solid,
                                                          width:
                                                              width * 0.0025),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.015)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  )
                                ],
                              );
                            }))
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
