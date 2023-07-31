import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/auth/country_list.dart';
import 'package:paramount_students/ui/auth/login/view_model/login_view_model.dart';
import 'package:paramount_students/ui/auth/otp/otp.dart';
import 'package:paramount_students/ui/auth/registration/view/registration.dart';

class LoginMobileEntry extends StatefulWidget {
  const LoginMobileEntry({Key? key, required this.model}) : super(key: key);
  final LoginViewModel model;

  @override
  State<LoginMobileEntry> createState() => _LoginMobileEntryState();
}

class _LoginMobileEntryState extends State<LoginMobileEntry> {
  bool obscureText = true;
  // TextEditingController mobileController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  // TODO: Move to ViewModel
  Country currentCountry = Countries.psTR;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mobile Number"),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
              autofocus: true,
              controller: widget.model.mobileController,
              keyboardType: TextInputType.number,
              onChanged: (String value) {},
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.yellow,
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        currentCountry = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryList(
                                    currentCountry: currentCountry,
                                    isItForMobileNumber: true,
                                  )),
                        );
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            foregroundImage: AssetImage(
                              currentCountry.flagPath!,
                            ),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          sText(currentCountry.dialCode, size: 12),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: psBlack1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      color: Colors.black,
                      height: 20,
                      width: 1,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: HexColor("#191C1C"))),
              )),
          const SizedBox(
            height: 18,
          ),
          const Text("Password"),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: obscureText,
            controller: widget.model.passwordController,
            onChanged: (String value) {
              setState(() {
                print(value);
              });
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    if (obscureText) {
                      obscureText = false;
                    } else {
                      obscureText = true;
                    }
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
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
              height: 50,
              minWidth: 380,
              elevation: 0,
              onPressed: () async {
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
              },
              color: widget.model.passwordController.text.isNotEmpty &&
                      widget.model.mobileController.text.isNotEmpty
                  ? appYellowText
                  : Colors.grey[100],
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text("Submit"),
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
              color: widget.model.passwordController.text.isNotEmpty &&
                      widget.model.mobileController.text.isNotEmpty
                  ? Colors.grey[100]
                  : appYellowText,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text("Register With Paramount Students"),
            ),
          ),
        ],
      ),
    );
  }
}
