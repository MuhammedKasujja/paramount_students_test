import 'package:flutter/material.dart';
import 'package:paramount_students/models/store.dart';
import 'package:provider/provider.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class ApplicationReviewBar extends StatelessWidget {
  const ApplicationReviewBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<Store>(context, listen: false).clearFileData();
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back,
                ),
                const SizedBox(
                  width: 2,
                ),
                sText(
                  'Back',
                  color: appBlackText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
