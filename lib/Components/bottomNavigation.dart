// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/homeScreen.dart';
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
                child: Icon(
                  CupertinoIcons.house_alt_fill,
                  color: violet,
                  size: width * 0.06,
                ),
                onPressed: () {
                  Get.offAll(() => HomeScreen());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.square_list,
                  color: violet,
                  size: width * 0.06,
                ),
                onPressed: () {
                  Get.offAll(() => Projects());
                }),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.add_circled,
                  color: violet,
                  size: width * 0.09,
                ),
                onPressed: () {}),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.calendar_today,
                  color: violet,
                  size: width * 0.06,
                ),
                onPressed: () {}),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.person_solid,
                  color: violet,
                  size: width * 0.06,
                ),
                onPressed: () {}),
          ],
        ),
      ),
      // ),
    );
  }
}
