import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class ApplicationReviewTitleBar extends StatelessWidget {
  const ApplicationReviewTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        sText(
          'Application Review',
          size: 20,
          weight: FontWeight.bold,
          color: appBlackText,
        ),
        const SizedBox(
          height: 10,
          child: Divider(
            thickness: 1.0,
            color: appBlackText,
          ),
        )
      ]),
    );
  }
}
