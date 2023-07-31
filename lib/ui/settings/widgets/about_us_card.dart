import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: false,
                ),
                header: Padding(
                  padding: const EdgeInsets.all(10),
                  child: sText(
                    PSStrings.psAboutParamount,
                    weight: FontWeight.w600,
                    size: 16,
                  ),
                ),
                collapsed: const SizedBox.shrink(),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    sText(
                      PSStrings.psPolicyheader,
                      size: 14,
                      lHeight: 1.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    sText(
                      PSStrings.psPolicyBody,
                      maxLines: 15,
                      weight: FontWeight.w400,
                      color: const Color(0xFF191C1C).withOpacity(0.7),
                      size: 12,
                      lHeight: 1.5,
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(
                        crossFadePoint: 0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
