// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/Bottomsheets/add_sheet.dart';
import 'package:project_tasker/View/account.dart';
import 'package:project_tasker/View/calendar.dart';
import 'package:project_tasker/View/home_screen.dart';
import 'package:project_tasker/View/projects.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.12,
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.055, vertical: height * 0.02),
      decoration: BoxDecoration(
          color: light, borderRadius: BorderRadius.circular(width * 0.07)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Get.currentRoute == "/HomeScreen"
                    ? Icon(
                        CupertinoIcons.house_alt,
                        color: primaryColor,
                        size: width * 0.06,
                      )
                    : Icon(
                        CupertinoIcons.house_alt,
                        color: secondaryColor,
                        size: width * 0.06,
                      ),
                onPressed: () {
                  Get.to(() => HomeScreen());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Get.currentRoute == "/Projects"
                    ? Icon(
                        CupertinoIcons.square_list,
                        color: primaryColor,
                        size: width * 0.06,
                      )
                    : Icon(
                        CupertinoIcons.square_list,
                        color: secondaryColor,
                        size: width * 0.06,
                      ),
                onPressed: () {
                  Get.to(() => Projects());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.add_circled,
                  color: primaryColor,
                  size: width * 0.1,
                ),
                onPressed: () {
                  Get.bottomSheet(AddSheet());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Get.currentRoute == "/Calendar"
                    ? Icon(
                        CupertinoIcons.calendar,
                        color: primaryColor,
                        size: width * 0.06,
                      )
                    : Icon(
                        CupertinoIcons.calendar,
                        color: secondaryColor,
                        size: width * 0.06,
                      ),
                onPressed: () {
                  Get.to(() => Calendar());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Get.currentRoute == "/Account"
                    ? Icon(
                        CupertinoIcons.person,
                        color: primaryColor,
                        size: width * 0.06,
                      )
                    : Icon(
                        CupertinoIcons.person,
                        color: secondaryColor,
                        size: width * 0.06,
                      ),
                onPressed: () {
                  Get.to(() => Account());
                }),
          ],
        ),
      ),
      // ),
    );
  }
}
