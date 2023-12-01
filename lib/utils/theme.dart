import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppTheme.scaffoldBg,
    useMaterial3: true,
  );
  static const scaffoldBg = Color.fromARGB(255, 247, 250, 253);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;
  static const yellowColor = Colors.yellow;
  static const blueColor = Colors.blue;
  static const greyColor = Colors.grey;
  static const darkGreyColor1 = Color.fromARGB(255, 83, 83, 83);
  static const lightGreyColor1 = Color(0xFFEEEDED);
}

const txt15BlackSB = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.blackColor);
const txt17BlackB = TextStyle(
    fontSize: 17, fontWeight: FontWeight.w700, color: AppTheme.blackColor);
const txt19BlackB = TextStyle(
    fontSize: 19, fontWeight: FontWeight.w700, color: AppTheme.blackColor);
const txt12GreySB = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.greyColor);
const txt12GreySM = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w300, color: AppTheme.darkGreyColor1);
const txt12Black = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppTheme.blackColor);
const txt14White = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500, color: AppTheme.whiteColor);
const txt16Black = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.blackColor);
