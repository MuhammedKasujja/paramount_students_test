import "package:flutter/material.dart";
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({super.key});

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: sText(
                'Clear All',
                size: 12,
              ),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: psColorPrimary200,
                  padding: EdgeInsets.only(left: 10, right: 10))),
        ],
      ),
    );
  }
}
