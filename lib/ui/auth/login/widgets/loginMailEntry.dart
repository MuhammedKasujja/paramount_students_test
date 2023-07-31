import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';
import '../../otp/otp.dart';
import 'package:paramount_students/app_utils/extensions/validation_extension.dart';

import '../../../../app_utils/helper/helper.dart';
import '../../registration/view/registration.dart';
import '../view_model/login_view_model.dart';

class LoginMailEntry extends StatefulWidget {
  final LoginViewModel model;
  LoginMailEntry({Key? key, required this.model}) : super(key: key);

  @override
  State<LoginMailEntry> createState() => _LoginMailEntryState();
}

class _LoginMailEntryState extends State<LoginMailEntry> {
  final _valkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _valkey,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email"),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: widget.model.emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: context.validateEmailAddress,
              onChanged: (String value) {},
              decoration: InputDecoration(
                suffixIcon: widget.model.emailCancelIcon,
                hintText: "Please Enter Email Address",
                hintStyle: const TextStyle(fontSize: 12),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: appYellowText),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text("Password"),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: widget.model.passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: context.validatePassword,
              obscureText: widget.model.isVisble,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: widget.model.togglevisibility,
                  child: Icon(
                    widget.model.isVisble
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                hintStyle: const TextStyle(fontSize: 12),
                hintText: "Please Enter Your Password",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: appYellowText)),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Center(
              child: MaterialButton(
                elevation: 0,
                height: 50,
                minWidth: 380,
                onPressed: () async {
                  widget.model.validated = _valkey.currentState!.validate();
                  widget.model.checkValidatedcolor();
                  setState(() {});
                  if (_valkey.currentState!.validate()) {
                    final bool canLogin = await widget.model.login();

                    if (canLogin) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OTPScreen(model: widget.model),
                        ),
                      );
                    } else {
                      toastMessage('Please Try again');
                    }
                  }
                },
                color: widget.model.passwordController.text.isNotEmpty &&
                        widget.model.emailController.text.isNotEmpty
                    ? appYellowText
                    : Colors.grey[100],
                // color: model.validate ? psColorPrimary1000 : psGrey6,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: widget.model.isLoading
                    ? const AppLoader(
                        size: 80,
                        // color: psColorPrimary1000,
                        color: psGrey1,
                      )
                    : const Text("Submit"),
              ),
            ),
            const SizedBox(height: 64),
            Center(
              child: MaterialButton(
                height: 50,
                elevation: 0,
                minWidth: 380,
                onPressed: () {
                  navigateTo(context, const Registration());
                },
                color: widget.model.registerButtonColor,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Register With Paramount Students"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
