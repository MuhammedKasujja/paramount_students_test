import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/loaders.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/ui/auth/registration/widgets/registeration_request_submit.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key, required this.model}) : super(key: key);
  final RegisterationViewModel model;
  @override
  Widget build(BuildContext context) {
    return model.isLoading
        ? appLoader
        : AlertDialog(
            backgroundColor: Colors.white,
            // shadowColor: psColorPrimary100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 128,
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width * 0.40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: psColorPrimary1000,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: sText(PSStrings.psCancel,
                        size: 16, weight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 128,
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width * 0.40,
                  onPressed: () async {
                    final isSuccess = await model.sendAllFormRequest(context);

                    if (isSuccess) {
                      goTo(
                        context,
                        const RegisterReqSubmit(),
                      );
                    } else {
                      toastMessage(
                        'Registeration Fail\n Please try again later',
                        long: true,
                      );
                    }
                  },
                  elevation: 0,
                  color: psColorPrimary1000,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      sText(PSStrings.psYes, size: 16, weight: FontWeight.w400),
                ),
              ),
            ],
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                sText(
                  'Confirm to send',
                  weight: FontWeight.w600,
                  size: 28,
                ),
                const Spacing.largeHeight(),
                sText(
                  'Are you sure you want to submit all of your educational information?',
                  align: TextAlign.center,
                  weight: FontWeight.w400,
                  size: 14,
                  color: const Color(0XFF8E9191),
                ),
              ],
            ),
          );
  }
}
