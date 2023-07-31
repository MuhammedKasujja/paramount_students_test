import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';

import '../document_item.dart';
import 'base_collapse_card.dart';

class DocumentsCard extends StatelessWidget {
  const DocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ProfileViewModel();
    return BaseCollapseCard(
      title: PSStrings.psDocuments,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sText(
            'You can only upload files up to 10 MiB in size each from the following types: JPEG, GIF, PNG, PDF. Please make sure that the image is not blurry or distorted and has plenty of contrast. Remember that they should be legible when printed out.',
            lHeight: 1.5,
            maxLines: 12,
          ),
          const SizedBox(
            height: 20,
          ),
          sText(
            'Verified Documents',
            weight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          model.userData.document?.highschoolCertificate != null
              ? const DocumentItem(
                  name: 'High School Certificate.pdf',
                  size: '7.09 MB',
                )
              : const SizedBox.shrink(),
          model.userData.document?.highschoolMarksheet != null
              ? const DocumentItem(
                  name: 'High School Marksheet.pdf',
                  size: '5.09 MB',
                )
              : const SizedBox.shrink(),
          model.userData.document?.localIdCard != null
              ? const DocumentItem(
                  name: 'Local ID card.pdf',
                  size: '1.20 MB',
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
