import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home_screen.dart';
import './screens/place_details_screen.dart';

import './constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryIconTheme: IconThemeData(
            color: Colors.black,
            size: 36.0,
          ),
          textTheme: TextTheme(
            title: GoogleFonts.workSans(
              fontSize: 25.0,
              color: Colors.black87,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w800,
            ),
            subtitle: GoogleFonts.workSans(
              fontSize: 22.0,
              color: Colors.black,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
            ),
            button: GoogleFonts.workSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            body1: GoogleFonts.workSans(
              fontSize: 18.0,
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
            display1: GoogleFonts.workSans(
              fontSize: 28.0,
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            display2: GoogleFonts.workSans(
              fontSize: 20.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          )),
      home: HomeScreen(),
      routes: {
        Routes.PLACE_DETAILS_SCREEN: (ctx) => PlaceDetailScreen(),
      },
    );
  }
}
