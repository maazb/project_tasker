// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Helper/values.dart';

class PrivacyPolicySheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrivacyPolicySheetState();
}

class _PrivacyPolicySheetState extends State {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: height * 0.55,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * 0.06),
              topRight: Radius.circular(width * 0.06)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                            "Privacy policy",
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.025),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.1,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.055, vertical: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                    onPressed: null,
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(width * 0.03)),
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
                            // Text(
                            //   "Cancel",
                            //   style: GoogleFonts.poppins(
                            //       color: violet,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: height * 0.022),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(width * 0.03)),
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
                              "OK",
                              style: GoogleFonts.poppins(
                                  color: violet,
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
      ),
    );
  }
}
