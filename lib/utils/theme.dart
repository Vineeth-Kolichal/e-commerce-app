import 'package:flutter/material.dart';

class AppTheme {
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;
  static const greyColor = Colors.grey;
  static const darkGreyColor1 = Color.fromARGB(255, 83, 83, 83);
  static const lightGreyColor1 = Color(0xFFEEEDED);
}

const txt15BlackSB = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.blackColor);
const txt17BlackB = TextStyle(
    fontSize: 17, fontWeight: FontWeight.w700, color: AppTheme.blackColor);
const txt12GreySB = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.greyColor);
const txt12GreySM = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w300, color: AppTheme.darkGreyColor1);
