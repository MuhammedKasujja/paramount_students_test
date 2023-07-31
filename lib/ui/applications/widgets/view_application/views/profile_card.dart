import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';

import '../details_item.dart';
import 'base_collapse_card.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ProfileViewModel();
    return BaseCollapseCard(
      title: PSStrings.psProfile,
      body: Column(
        children: [
          DetailsItem(title: 'First Name', value: model.userData.firstName!),
          DetailsItem(title: 'Last Name', value: model.userData.lastName!),
          DetailsItem(
              title: 'Father`s Name',
              value: model.userData.fatherName ?? ''),
          DetailsItem(
              title: 'Mother`s Name',
              value: model.userData.motherName ?? ''),
          DetailsItem(
              title: 'Date of Birth', value: model.userData.dob ?? ''),
          DetailsItem(title: 'Gender', value: model.userData.gender ?? ''),
          DetailsItem(title: 'Email Address', value: model.userData.email!)
        ],
      ),
    );
  }
}
