import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/ui/shortlist/models/dummy_data.dart';

class FilterButton extends StatefulWidget {
  final int index;
  const FilterButton({Key? key, required this.index}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  List selectedBrowse = [];
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        setState(() {
          if (selectedBrowse.contains(browseList[widget.index].id)) {
            selectedBrowse.remove(browseList[widget.index].id);
          } else {
            selectedBrowse.add(browseList[widget.index].id);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          horizontal: AppDimension.tiny,
        ),
        decoration: BoxDecoration(
          color: selectedBrowse.contains(browseList[widget.index].id)
              ? appYellowText
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: appYellowText),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            selectedBrowse.contains(browseList[widget.index].id)
                ? const Icon(
                    Icons.check,
                  )
                : const SizedBox.shrink(),
            sText(
              browseList[widget.index].name,
              size: 14,
              weight: FontWeight.normal,
              align: TextAlign.start,
              color: appBlackText,
            ),
          ],
        ),
      ),
    );
  }
}
