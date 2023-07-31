import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';

class InfoWidget extends StatefulWidget {
  final String text;
  // final double width;
  const InfoWidget({
    super.key,
    required this.text,
    // required this.width,
  });

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5.0,
      ),
      child: Container(
        height: 31,
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
        // width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: psColorPrimary400),
        child: Text(widget.text,
            style: PSTextStyle
                .registerUnselectedTabStyle // (fontSize: 12, fontWeight: FontWeight.w400),
            ),
      ),
    );
  }
}
