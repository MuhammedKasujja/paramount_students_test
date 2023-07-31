import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/shortlist/models/dummy_data.dart';

class RecentlySearchedList extends StatelessWidget {
  const RecentlySearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  const Spacing.width(
                    10,
                  ),
                  sText(
                    dummyData[index].dept,
                    color: Colors.grey,
                  )
                ],
              ),
            );
          }),
    );
  }
}
