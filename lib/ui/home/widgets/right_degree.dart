import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class RightDegreeCard extends StatelessWidget {
  const RightDegreeCard({
    super.key,
    required this.degree,
    required this.onTap,
  });
  final String degree;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: appWidth(context) * 0.75,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFCF3CF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150,
              child:
                  sText("$degree Degrees", size: 12, weight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: appWidth(context) * 0.8,
              child: sText(
                  "A ${degree.toLowerCase()} degree can lead to new opportunities in a variety of industries. Find ${degree.toLowerCase()} degrees from best universities.",
                  size: 12,
                  weight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // width: appWidth(context) * 0.8,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: appBlackText))),
              // width: appWidth(context) * 0.8,
              child: sText("View All Bachelor's Degree Programs",
                  size: 12, weight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
