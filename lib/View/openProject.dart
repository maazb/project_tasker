// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Helper/values.dart';

class OpenProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OpenProjectState();
}

class _OpenProjectState extends State {
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
                    "Morning Routine",
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
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
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
                                  borderRadius:
                                      BorderRadius.circular(width * 0.06)),
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
                                                    style: BorderStyle.solid,
                                                    width: width * 0.0025),
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
        ),
      ),
    );
  }
}
