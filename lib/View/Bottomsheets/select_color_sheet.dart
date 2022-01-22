// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';

class SelectProjectColorSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectProjectColorSheetState();
}

class _SelectProjectColorSheetState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();

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
                            "Select Color",
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
                        GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.02),
                          itemCount: 7,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: height * 0.01,
                                  crossAxisSpacing: width * 0.02,
                                  childAspectRatio: 1),
                          itemBuilder: (builder, index) {
                            return CupertinoButton(
                              onPressed: () {
                                _loadDataController
                                    .selectedColorAddProject.value = index;
                                Get.back();
                              },
                              padding: EdgeInsets.all(0),
                              minSize: width * 0.001,
                              child: Container(
                                //height: height * 0.07,
                                //width: width,

                                decoration: BoxDecoration(
                                  color: _loadDataController.getColor(index),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: height * 0.01,
                                      horizontal: width * 0.04),
                                  height: height * 0.05,
                                  width: width * 0.1,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
                    onPressed: () => Get.back(),
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
                            //   CupertinoIcons.checkmark_square,
                            //   color: violet,
                            // ),
                            // SizedBox(width: width * 0.015),
                            Text(
                              "Cancel",
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
                    onPressed: null,
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.42,
                      // decoration: BoxDecoration(
                      //     color: light,
                      //     borderRadius: BorderRadius.circular(width * 0.03)),
                      // child: Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       // Icon(
                      //       //   CupertinoIcons.pencil_ellipsis_rectangle,
                      //       //   color: violet,
                      //       // ),
                      //       // SizedBox(width: width * 0.015),
                      //       Text(
                      //         "Select",
                      //         style: GoogleFonts.poppins(
                      //             color: violet,
                      //             fontWeight: FontWeight.w400,
                      //             fontSize: height * 0.022),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
