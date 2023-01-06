import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0XFFFFFFFF);
const Color secondaryColor = Color(0XFF0B409C);
const Color titleColor = Color(0XFF10316B);
const Color iconColor = Color(0XFFFFCE63);
const Color backColor = Color(0XFFF2F7FF);

final myTextTheme = TextTheme(
  headline1: GoogleFonts.viga(
      fontSize: 88, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.viga(
      fontSize: 55, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.viga(fontSize: 44, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.viga(
      fontSize: 31, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.viga(fontSize: 22, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.viga(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.viga(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.viga(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.oxygen(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.oxygen(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.oxygen(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.oxygen(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.oxygen(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
