import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Components/bottom_navigation.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/Bottomsheets/about_us_sheet.dart';
import 'package:project_tasker/View/Bottomsheets/privacy_policy_sheet.dart';
import 'package:project_tasker/View/Bottomsheets/select_avatar_sheet.dart';
import 'package:project_tasker/View/Bottomsheets/select_theme_sheet.dart';
import 'package:project_tasker/View/login.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State {
  late double height;
  late double width;
  LoadDataController _loadDataController = Get.find();
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
                  "Account",
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.033),
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
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.025),
            child: Column(
              children: [
                // Container(
                //   alignment: Alignment.topLeft,
                //   // padding: EdgeInsets.fromLTRB(
                //   //     width * 0.05, height * 0.025, width * 0.04, height * 0.025),
                //   child: Container(
                //     margin: EdgeInsets.only(
                //         bottom: height * 0.03, top: height * 0.015),
                //     child: Text(
                //       "Options",
                //       style: GoogleFonts.poppins(
                //           fontSize: height * 0.035,
                //           color: grey,
                //           fontWeight: FontWeight.w400),
                //     ),
                //   ),
                //   // Text(
                //   //   "Account",
                //   //   style: GoogleFonts.gothicA1(
                //   //     textStyle: TextStyle(
                //   //         color: textColor,
                //   //         fontSize: width * 0.05,
                //   //         fontWeight: FontWeight.w700),
                //   //   ),
                //   // ),
                // ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    height: width * 0.13,
                    width: width * 0.13,
                  ),
                  title: Text(
                    _loadDataController.currentUserName.value,
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    _loadDataController.currentUserEmail.value,
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.018,
                        color: textLight,
                        fontWeight: FontWeight.w400),
                  ),
                  // trailing: Container(
                  //   height: height * 0.05,
                  //   width: width * 0.1,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(width * 0.03),
                  //       color: grey),
                  //   child: Icon(
                  //     CupertinoIcons.forward,
                  //     color: textColor,
                  //     size: width * 0.045,
                  //   ),
                  // ),
                ),
                // Container(
                //   color: grey,
                //   margin: EdgeInsets.symmetric(vertical: height * 0.01),
                //   height: height * 0.03,
                //   width: width,
                // ),
                SizedBox(
                  height: height * 0.03,
                ),
                // Container(
                //   alignment: Alignment.topLeft,
                //   padding: EdgeInsets.fromLTRB(
                //       width * 0.04, height * 0.025, width * 0.04, height * 0.025),
                //   child: Text(
                //     "Content",
                //     style: GoogleFonts.gothicA1(
                //       textStyle: TextStyle(
                //           color: textColor,
                //           fontSize: width * 0.06,
                //           fontWeight: FontWeight.w700),
                //     ),
                //   ),
                // ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(SelectThemeSheet());
                  },
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/history.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "Theme",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  onTap: () => Get.bottomSheet(SelectAvatarSheet()),
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/wishlist.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "Avatar",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/notification.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  onTap: () => Get.bottomSheet(AboutUsSheet()),
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/logout.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "About us",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  onTap: () => Get.bottomSheet(PrivacyPolicySheet()),
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/logout.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "Privacy policy",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offAll(Login());
                  },
                  contentPadding: EdgeInsets.all(0),
                  // leading: SvgPicture.asset(
                  //   'assets/icons/logout.svg',
                  //   height: width * 0.13,
                  //   width: width * 0.13,
                  // ),
                  title: Text(
                    "Log out",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.022,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: grey),
                    child: Icon(
                      CupertinoIcons.forward,
                      color: textColor,
                      size: width * 0.045,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomNavigation(),
    );
  }
}
