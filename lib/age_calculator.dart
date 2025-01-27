import 'package:flutter/material.dart';
import 'date_box_widget.dart';
import 'date_details_row_item.dart';
import 'next_birthday_row_item_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AgeCalculatorPage(),
    );
  }
}

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  TextEditingController _birthdateController = TextEditingController();
  int years = 0, months = 0, days = 0;
  int totalMonths = 0, totalWeeks = 0, totalDays = 0, totalHours = 0;
  int totalMinutes = 0, totalSeconds = 0;
  int nextMonths = 0, nextDays = 0;
  String nextBirthdayDay = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///DATE
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color(0xff3b57ad),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 15, bottom: 8),
                        child: Text(
                          "Birthdate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _birthdateController,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showCalenderView();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your Birthdate",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///AGE DETAILS
              Card(
                elevation: 10.0,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You are(Your age right now)",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateBoxWidget(
                          boxColor: Color(0xff686ede),
                          label: "$years",
                          calenderLabel: "Years",
                        ),
                        DateBoxWidget(
                          boxColor: Color(0xffc4cc9b),
                          label: "$months",
                          calenderLabel: "Months",
                        ),
                        DateBoxWidget(
                          boxColor: Color(0xff6dd1b0),
                          label: "$days",
                          calenderLabel: "Days",
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(thickness: 1.0, height: 40.0),
                    ),
                    DateDetailsRowItem(label1: "Months old", numbers: "$totalMonths"),
                    SizedBox(height: 20.0),
                    DateDetailsRowItem(label1: "Weeks old", numbers: "$totalWeeks"),
                    SizedBox(height: 20.0),
                    DateDetailsRowItem(label1: "Days old", numbers: "$totalDays"),
                    SizedBox(height: 20.0),
                    DateDetailsRowItem(
                        label1: "Hours old(approx)", numbers: "$totalHours"),
                    SizedBox(height: 20.0),
                    DateDetailsRowItem(
                        label1: "Minutes old(approx)", numbers: "$totalMinutes"),
                    SizedBox(height: 20.0),
                    DateDetailsRowItem(
                        label1: "Seconds old(approx)", numbers: "$totalSeconds"),
                  ],
                ),
              ),

              SizedBox(height: 13.0),
              Card(
                margin: EdgeInsets.zero,
                color: Color(0xff56ab91),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Next Birthday",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w800)),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              NextBirthdayRowItemWidget(
                                  calendernumber: "$nextMonths",
                                  calenderlabel: "Months"),
                              SizedBox(width: 20.0),
                              NextBirthdayRowItemWidget(
                                  calendernumber: "$nextDays",
                                  calenderlabel: "Days"),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            text: "Your birthday is on",
                            style: TextStyle(
                                fontSize: 22.5,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: ' $nextBirthdayDay ',
                                  style: TextStyle(
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.w900)),
                              TextSpan(text: "this year."),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// THIS METHOD WILL SHOW THE DATE PICKER DIALOG
  Future<void> showCalenderView() async {
    DateTime? birthdate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (birthdate != null) {
      setState(() {
        _birthdateController.text =
        "${birthdate.day}-${birthdate.month}-${birthdate.year}";
        calculateAge(birthdate);
      });
    } else {
      var snackbar = SnackBar(
        content: Text(
          "Please select a valid birthdate!",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Color(0xff0a9396),
              backgroundColor: Color(0xfff5ebe0)),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  /// Function to calculate age and next birthday
  void calculateAge(DateTime birthdate) {
    DateTime today = DateTime.now();

    // Calculate years, months, and days
    int ageInYears = today.year - birthdate.year;
    int ageInMonths = today.month - birthdate.month;
    int ageInDays = today.day - birthdate.day;

    if (ageInDays < 0) {
      ageInMonths -= 1;
      ageInDays += 30; // Adjusting days
    }
    if (ageInMonths < 0) {
      ageInYears -= 1;
      ageInMonths += 12; // Adjusting months
    }

    // Calculating total months, weeks, days, hours, minutes, seconds
    totalMonths = (ageInYears * 12) + ageInMonths;
    totalWeeks = totalDays ~/ 7;
    totalDays = today.difference(birthdate).inDays;
    totalHours = totalDays * 24;
    totalMinutes = totalHours * 60;
    totalSeconds = totalMinutes * 60;

    // Next birthday calculation
    DateTime nextBirthday = DateTime(today.year, birthdate.month, birthdate.day);
    if (nextBirthday.isBefore(today)) {
      nextBirthday = DateTime(today.year + 1, birthdate.month, birthdate.day);
    }

    nextMonths = nextBirthday.month - today.month;
    nextDays = nextBirthday.day - today.day;
    nextBirthdayDay = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][nextBirthday.weekday - 1];

    setState(() {
      years = ageInYears;
      months = ageInMonths;
      days = ageInDays;
    });
  }
}











