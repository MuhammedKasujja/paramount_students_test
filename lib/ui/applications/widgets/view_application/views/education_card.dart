import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';

import '../details_item.dart';
import 'base_collapse_card.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ProfileViewModel();
    return BaseCollapseCard(
      title: PSStrings.psEducation,
      body: Column(
        children: [
          DetailsItem(
            title: 'Mobile',
            value: model.userData.highSchool?.phone ?? '',
          ),
          DetailsItem(
            title: 'City',
            value: model.userData.education?.highSchoolCity ?? '',
          ),
          DetailsItem(
            title: 'High School',
            value: model.userData.highSchool?.name ?? '',
          ),
          DetailsItem(
            title: 'Graduation Year',
            value:
                model.userData.education?.highSchoolGraduationYear.toString() ??
                    '',
          ),
          DetailsItem(
            title: 'Student ID Number',
            value: model.userData.education?.studentIdNumber.toString() ?? '',
          ),
          DetailsItem(
            title: 'Study Language',
            value: model.userData.education?.studyLanguage ?? '',
          ),
        ],
      ),
    );
  }
}
