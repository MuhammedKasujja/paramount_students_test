import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/notification/widget/bottom_sheet_widgets.dart';

actionsModalBottomSheet(
  BuildContext context,
) {
  double sheetHeight = 250;
  showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            return Container(
                height: sheetHeight,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    const Spacing.meduimHeight(),
                    Container(
                      color: appBlackText,
                      height: 5,
                      width: 100,
                    ),
                    const Spacing.meduimHeight(),
                    const Expanded(
                      child: BottomSheetWidget(),
                    ),
                    const Spacing.meduimHeight(),
                  ],
                ));
          },
        );
      });
}
