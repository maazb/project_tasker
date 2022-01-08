import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tasker/Components/bottomNavigation.dart';
import 'package:project_tasker/Helper/values.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State {
  late double height;
  late double width;
  DateTime? _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                  "Calendar",
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: width * 0.05,
                    left: width * 0.05,
                    top: height * 0.006),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height * 0.012),
                              width: width,
                              height: height * 0.055,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius:
                                    BorderRadius.circular(height * 0.03),
                                // boxShadow: [
                                //   BoxShadow(
                                //       blurRadius: 20,
                                //       color: light,
                                //       offset: Offset(0, 1))
                                // ]
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.025, bottom: height * 0.02),
                              width: width,
                              height: height * 0.37,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius:
                                    BorderRadius.circular(height * 0.03),
                                // boxShadow: [
                                //   BoxShadow(
                                //       blurRadius: 20,
                                //       color: light,
                                //       offset: Offset(0, 1))
                                // ]
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.015),
                        child: TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay:
                              DateTime.now().subtract(Duration(days: 365)),
                          lastDay: DateTime.now().add(Duration(days: 365)),
                          calendarFormat: CalendarFormat.month,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          daysOfWeekHeight: height * 0.05,
                          rowHeight: height * 0.05,
                          headerStyle: HeaderStyle(
                            headerMargin:
                                EdgeInsets.only(bottom: height * 0.02),
                            titleTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            formatButtonShowsNext: false,
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            weekendStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            weekendTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            todayTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: lightViolet,
                              fontWeight: FontWeight.w200,
                            ),
                            disabledTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: lightViolet,
                              fontWeight: FontWeight.w200,
                            ),
                            rangeEndTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: lightViolet,
                              fontWeight: FontWeight.w200,
                            ),
                            outsideTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.018,
                              color: lightViolet,
                              fontWeight: FontWeight.w200,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: violet,
                              shape: BoxShape.circle,
                            ),
                            isTodayHighlighted: false,

                            // todayDecoration: BoxDecoration(
                            //   color: purple,
                            //   shape: BoxShape.circle,
                            // ),
                            markerDecoration: BoxDecoration(
                              color: violet,
                              shape: BoxShape.circle,
                            ),
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay =
                                  focusedDay; // update `_focusedDay` here as well
                            });
                          },
                        ),
                      ),
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
                      itemCount: 7,
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
                                          "Do submit Assignment 2 of maths before 10 AM.",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomNavigation(),
    );
  }
}