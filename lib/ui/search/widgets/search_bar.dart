import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/search/widgets/search_filter.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({Key? key,required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimension.medium),
          decoration: const BoxDecoration(),
          child: TextField(
            onTap: () {},
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(AppDimension.tiny),
              border: searchBoxOutlineBorder,
              enabledBorder: searchBoxOutlineBorder,
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: AppDimension.large * 0.85,
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: AppDimension.large * 0.85,
                    ),
                  ),
                  const Spacing.width(
                    10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 30,
                    width: 1,
                  ),
                  const Spacing.width(
                    10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await goTo(
                        context,
                        const SearchFilter(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Spacing.width(
                          5,
                        ),
                        displayLocalImage(
                          "filter.png",
                          radius: 0,
                        ),
                        const Spacing.smallWidth(),
                        sText(
                          PSStrings.psFilter,
                          size: 12,
                        ),
                        const Spacing.smallWidth(),
                      ],
                    ),
                  ),
                ],
              ),
              focusedBorder: searchBoxOutlineBorder,
            ),
            textInputAction: TextInputAction.search,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder searchBoxOutlineBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: appBlackText),
  borderRadius: BorderRadius.circular(10),
);
