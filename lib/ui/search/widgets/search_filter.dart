import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/buttons/ps_card_button.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/search/widgets/filter_list.dart';
import 'package:paramount_students/ui/shortlist/models/dummy_data.dart';
import 'package:paramount_students/utils/ps_color.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: sText(
            PSStrings.psFilter,
            weight: FontWeight.bold,
            color: appBlackText,
          ),
          iconTheme: const IconThemeData(
            color: appBlackText,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: rightPadding(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    sText(
                      PSStrings.psCancel,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FilterList(
                    title: titles[index],
                  );
                },
              ),
            ),
            const Spacing.smallHeight(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimension.medium,
              ),
              child: PsCardButton(
                buttonColor: HexColor("#191C1C"),
                onPressed: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                buttonText: PSStrings.psSearch,
              ),
            ),
            const Spacing.smallHeight(),
          ],
        ));
  }
}
