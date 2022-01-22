import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:project_tasker/Controller/load_data_controller.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:project_tasker/View/home_screen.dart';

void main() {
  //Get.put(LoadDataController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
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
  LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  void initState() {
    super.initState();
    loadData();

    getData();
  }

  void getData() async {
    _loadDataController.getNotes();
    _loadDataController.getProjects();
    _loadDataController.addColors();
    _loadDataController.addThemes();
  }

  //LoadDataController _loadDataController = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  loadData() async {
    Future.delayed(Duration(milliseconds: 3500)).then((value) async {
      //await LoadDataController.instance.getClassList();

      Get.offAll(() => HomeScreen());
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
              height: height * 0.2,
              width: width * 0.7,
              child: SvgPicture.asset("assets/icons/logo.svg")),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(height * 0.03),
        child: CircularProgressIndicator(
          strokeWidth: width * 0.01,
          color: primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
