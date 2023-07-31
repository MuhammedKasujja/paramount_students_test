import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/search/widgets/filter_button.dart';
import 'package:paramount_students/ui/shortlist/models/dummy_data.dart';

class FilterList extends StatelessWidget {
  final String title;
  const FilterList({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sText(title, weight: FontWeight.bold),
              const Spacing.smallHeight(),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: browseList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return FilterButton(
                      index: index,
                    );
                  },
                ),
              ),
              const Divider(
                color: appBlackText,
                endIndent: AppDimension.large,
                indent: AppDimension.large,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
