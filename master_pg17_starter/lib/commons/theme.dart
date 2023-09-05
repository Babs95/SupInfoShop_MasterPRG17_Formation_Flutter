import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_pg17_starter/commons/constant_color.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kWhiteColor,
    appBarTheme: appBarTheme,
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
      .apply(
      displayColor: Colors.black,
      bodyColor: Colors.black
    )
  );
}

const appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  iconTheme: IconThemeData(color: kPrimaryColor)
);