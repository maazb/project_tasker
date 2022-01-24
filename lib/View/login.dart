import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double height;
  late double width;
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authStateCheck();
  }

  void authStateCheck() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Auth: User not logged in');
      } else {
        print('Auth: User logged in');
        // _loadDataController.currentUserId.value = user.uid;
        // _loadDataController.currentUserName.value =
        //     user.email!.split("@").first;
        // _loadDataController.currentUserEmail.value = user.email!;

        Get.offAll(HomeScreen(
          userId: user.uid,
          userName: user.email!.split("@").first,
          userEmail: user.email,
        ));
      }
    });
  }

  void registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _textEditingControllerEmail.text,
              password: _textEditingControllerPassword.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Register: Weak password error');
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 5),
          messageText: Text(
            'The password provided is too weak.',
            style: GoogleFonts.poppins(
                color: white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w400),
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        print('Register: email-already-in-use');
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 5),
          messageText: Text(
            'The account already exists for that email. Please Log In',
            style: GoogleFonts.poppins(
                color: white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w400),
          ),
        ));
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(GetSnackBar(
        messageText: Text(
          e.toString(),
          style: GoogleFonts.poppins(
              color: white,
              fontSize: height * 0.02,
              fontWeight: FontWeight.w400),
        ),
      ));
    }
  }

  void signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _textEditingControllerEmail.text,
              password: _textEditingControllerPassword.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Sign in: user-not-found');
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 5),
          messageText: Text(
            'No user found for that email.',
            style: GoogleFonts.poppins(
                color: white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w400),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        print('Sign in: Wrong password');
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 5),
          messageText: Text(
            'Wrong password provided for that user.',
            style: GoogleFonts.poppins(
                color: white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w400),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.7,
                      child: Image.asset(
                        'assets/icons/appIcon.png',
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width,
                      margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                          width * 0.055, height * 0.005),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.04),
                          height: height * 0.1,
                          width: width * 0.5,
                          child: TextField(
                            controller: _textEditingControllerEmail,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Email"),
                            cursorColor: primaryColor,
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018),
                            enabled: true,
                            maxLines: 1,
                          )),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width,
                      margin: EdgeInsets.fromLTRB(width * 0.055, height * 0.02,
                          width * 0.055, height * 0.005),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.04),
                          height: height * 0.1,
                          width: width * 0.5,
                          child: TextField(
                            controller: _textEditingControllerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                            cursorColor: primaryColor,
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018),
                            enabled: true,
                            maxLines: 1,
                          )),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: CupertinoButton(
                            onPressed: () {
                              registerUser();
                            },
                            padding: EdgeInsets.all(0),
                            minSize: width * 0.001,
                            child: Container(
                              decoration: BoxDecoration(
                                color: light,
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                              ),
                              child: Container(
                                  margin: EdgeInsets.all(width * 0.03),
                                  child: Text(
                                    "Register",
                                    style: GoogleFonts.poppins(
                                        color: primaryColor),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          child: CupertinoButton(
                            onPressed: () {
                              signIn();
                            },
                            padding: EdgeInsets.all(0),
                            minSize: width * 0.001,
                            child: Container(
                              decoration: BoxDecoration(
                                color: light,
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                              ),
                              child: Container(
                                  margin: EdgeInsets.all(width * 0.03),
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                        color: primaryColor),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
