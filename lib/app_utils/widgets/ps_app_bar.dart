import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class PSAppBar extends StatelessWidget {
  final String title;
  const PSAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: sText(
        title,
        weight: FontWeight.bold,
        color: appBlackText,
      ),
      iconTheme: const IconThemeData(color: appBlackText),
    );
  }
}
