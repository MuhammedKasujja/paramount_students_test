import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';

class Checklist extends StatelessWidget {
  final RegisterationViewModel model;
  const Checklist({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          ListTile(
            leading: model.fileUpload0 != null
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              model.fileUpload0 != null
                  ? PSStrings.psUploadedHSGM
                  : 'Please ${PSStrings.psUploadHighSchoolGrade}',
              style: PSTextStyle.checklistText,
            ),
          ),
          ListTile(
            leading: model.fileUpload1 != null
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              model.fileUpload1 != null
                  ? PSStrings.psUploadedHSC
                  : 'Please ${PSStrings.psUploadHighSchoolCert}',
              style: PSTextStyle.checklistText,
            ),
          ),
          //TODO: check figma file to confirm is this is part of the doc to upload

          // ListTile(
          //   leading: const Icon(Icons.check_circle,
          //       color: Color.fromRGBO(57, 181, 73, 1)),
          //   title: Text(
          //     PSStrings.psUploadedHST,
          //     style: PSTextStyle.checklistText,
          //   ),
          // ),
          ListTile(
            leading: model.fileUpload2 != null
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              model.fileUpload2 != null
                  ? 'Uploaded Your Formal Photo'
                  : PSStrings.psUploadedPhotoError,
              style: PSTextStyle.checklistText,
            ),
          ),
          ListTile(
            leading: model.emailController.text.isNotEmpty
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              PSStrings.psEmail,
              style: PSTextStyle.checklistText,
            ),
          ),
          ListTile(
            leading: model.fileUpload3 != null
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              model.fileUpload3 != null
                  ? 'Uploaded Your Loacal ID Card'
                  : PSStrings.psUploadedLocalIDError,
              style: PSTextStyle.checklistText,
            ),
          ),
          ListTile(
            leading: model.fileUpload4 != null
                ? const SuccessIcon()
                : const FailureIcon(),
            title: Text(
              model.fileUpload3 != null
                  ? 'Uploaded Your Passport Front'
                  : PSStrings.psUploadedPassportError,
              style: PSTextStyle.checklistText,
            ),
          ),
        ],
      ),
    );
  }
}

class FailureIcon extends StatelessWidget {
  const FailureIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.warning, color: Color.fromRGBO(245, 2, 2, 1));
  }
}

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle,
      color: Color.fromRGBO(57, 181, 73, 1),
    );
  }
}
