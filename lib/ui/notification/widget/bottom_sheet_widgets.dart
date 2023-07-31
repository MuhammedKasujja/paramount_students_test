import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/notification/model/data.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: bottomSheetData.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              bottomSheetData[index].icon,
              color: appBlackText,
            ),
            title: sText(
              bottomSheetData[index].title,
              color: appBlackText,
              weight: FontWeight.bold,
            ),
            subtitle: sText(
              bottomSheetData[index].subtitle,
              color: appBlackText,
            ),
            onTap: () => Navigator.of(context).pop(),
          );
        });
  }
}
