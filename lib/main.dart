import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/home_screen.dart';
import 'package:project_tasker/View/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height;
  late double width;
  //LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  void initState() {
    super.initState();
    //initializeFirebase();
    loadData();
  }

  // void initializeFirebase() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

  //LoadDataController _loadDataController = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  loadData() async {
    Future.delayed(Duration(milliseconds: 1200)).then((value) async {
      //await LoadDataController.instance.getClassList();

      Get.offAll(() => Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Center(
          child: Container(
              height: height * 0.4,
              width: width * 0.7,
              child: Image.asset("assets/icons/appIcon.png")),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(height * 0.03),
        child: CircularProgressIndicator(
          strokeWidth: 3.2,
          color: primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
