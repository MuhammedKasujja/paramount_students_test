import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';

class AcademicReqContentWidget extends StatelessWidget {
  final String description;
  const AcademicReqContentWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Html(
            data: description,
          ),
          const Spacing.smallHeight(),
        ],
      ),
    );
  }
}
