import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

customHomeWidget(
    {String? imagePath,
    String? course,
    String? schoolName,
    String? country,
    bool isProgram = true}) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: displayLocalImage(imagePath!, radius: 0),
          ),
          const SizedBox(
            height: 10,
          ),
          if (isProgram)
            SizedBox(
              width: 150,
              child: sText(course, size: 12, weight: FontWeight.bold),
            ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: sText(schoolName,
                size: 12,
                weight: !isProgram ? FontWeight.bold : FontWeight.normal),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: sText(country, size: 12),
          ),
        ],
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
