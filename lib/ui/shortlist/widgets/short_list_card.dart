import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/buttons/ps_card_button.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';

class ShortListCard extends StatelessWidget {
  final ShortListModel shortListModel;
  const ShortListCard({Key? key, required this.shortListModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: appShadow(Colors.grey[100]!, 4, 4, 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sText(shortListModel.dept, size: 20, weight: FontWeight.bold),
                  displayLocalImage(
                    "bookmark.png",
                    radius: 0,
                  )
                ],
              ),
              const Spacing.tinyHeight(),
              sText(
                shortListModel.university,
                size: 20,
                weight: FontWeight.w400,
              ),
              const Spacing.tinyHeight(),
              sText(
                shortListModel.univeristyLocation,
                weight: FontWeight.w400,
              ),
              const Spacing.meduimHeight(),
              Row(
                children: [
                  sText(
                    "\$${shortListModel.amount}/Year ",
                    weight: FontWeight.w400,
                  ),
                  sText(
                    shortListModel.date,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              const Spacing.meduimHeight(),
              PsCardButton(
                buttonColor: appYellowText,
                onPressed: () {},
                textColor: Colors.black,
                buttonText: PSStrings.psResumeApplication,
              )
            ],
          ),
        ),
        const Spacing.meduimHeight(),
      ],
    );
  }
}
