import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class PSTextStyle {
  static TextStyle onBoardingTextStyle = const TextStyle(
      color: Colors.white,
      fontFamily: "Rota",
      fontSize: 54,
      fontWeight: FontWeight.w800);

  static TextStyle registerTitleStyle = TextStyle(
      color: HexColor("#191C1C"),
      fontFamily: "Rota",
      fontSize: 33,
      fontWeight: FontWeight.w600);

  static TextStyle registerSelectedTabStyle = TextStyle(
      color: HexColor("#191C1C"),
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w600);

  static TextStyle registerUnselectedTabStyle = TextStyle(
      color: HexColor("#424242"),
      fontFamily: "Inter",
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static TextStyle uploadButtonStyle = const TextStyle(
      color: Color.fromRGBO(25, 28, 28, 0.7),
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static TextStyle replaceButtonStyle = const TextStyle(
      color: Colors.white,
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static TextStyle uploadHintStyle = TextStyle(
      color: HexColor("#8E9191"),
      fontFamily: "Inter",
      fontSize: 8,
      fontWeight: FontWeight.w400);

  static TextStyle checklistText = TextStyle(
      color: HexColor("#2E3131"),
      fontFamily: "Inter",
      fontSize: 12,
      fontWeight: FontWeight.w500);

  static TextStyle unselectedCountryStyle = const TextStyle(
      color: psBlack1,
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static TextStyle selectedCountryStyle = const TextStyle(
      color: psPrimaryColor,
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static TextStyle infoTextStyle = const TextStyle(
      color: psBlack3,
      fontFamily: "Inter",
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static TextStyle universityName = const TextStyle(
      color: psBlack3,
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.w600);
  static TextStyle universityinfo = const TextStyle(
      color: Color.fromRGBO(25, 28, 28, 0.9),
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w400);

  static TextStyle universitymoreinfo = const TextStyle(
      color: Color.fromRGBO(25, 28, 28, 0.9),
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static TextStyle virtualtourtexts = const TextStyle(
      color: psWhite,
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w700);
}
