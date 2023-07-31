import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class BaseCollapseCard extends StatelessWidget {
  final String title;
  final Widget body;
  const BaseCollapseCard({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: false,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
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
                    title,
                    weight: FontWeight.w600,
                    size: 16,
                  ),
                ),
                collapsed: const SizedBox.shrink(),
                expanded: body,
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
