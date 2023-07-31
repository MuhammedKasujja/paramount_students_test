import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/buttons/app_elevated_button.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/auth/login/view/login.dart';

class RegisterReqSubmit extends StatelessWidget {
  const RegisterReqSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () => goTo(
                    context,
                    const Login(),
                  ),
              child: Row(
                children: [
                  const Icon(Icons.close),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Center(child: Text(PSStrings.psCancel)),
                  ),
                ],
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimension.medium),
        child: Column(
          children: [
            const Spacing.bigHeight(),
            const Spacing.bigHeight(),
            Container(
              padding: const EdgeInsets.all(AppDimension.large),
              margin: const EdgeInsets.symmetric(vertical: AppDimension.large),
              decoration: const BoxDecoration(
                color: psSuccess,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/png/check_mark.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: sText2(
                PSStrings.psCongratulationApplication,
                size: 28,
                maxLines: 10,
                align: TextAlign.center,
                weight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            AppElevatedButton(
              label: PSStrings.psLoginPage,
              isLoading: false,
              borderColor: psColorPrimary1000,
              textColor: Colors.black,
              onPressed: () {
                goTo(context, const Login());
              },
            ),
            const Spacing.largeHeight(),
          ],
        ),
      ),
    );
  }
}
