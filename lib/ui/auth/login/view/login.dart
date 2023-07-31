import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/auth/login/qrcode_login.dart';
import 'package:paramount_students/ui/auth/login/view_model/login_view_model.dart';
import 'package:paramount_students/ui/auth/login/widgets/loginMailEntry.dart';
import 'package:paramount_students/ui/auth/login/widgets/loginMobileEntry.dart';
import 'package:paramount_students/utils/ps_color.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      onModelReady: (model) => model.init(),
      onDispose: (model) => model.dispose(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor("#FAFCFC"),
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            backgroundColor: HexColor("#FAFCFC"),
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Log In",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Rota"),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  // width: 380,
                  decoration: BoxDecoration(
                      color: HexColor("#EFF1F0"),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          minWidth: 160,
                          height: 50,
                          onPressed: () {
                            model?.goToMobileLogin();
                          },
                          color: model?.selectedLogin == model?.emailLogin
                              ? model?.selectedColor
                              : model?.unavailableColor,
                          textColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Login with Email"),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: 50,
                          minWidth: 175,
                          onPressed: () {
                            model?.goToEmailLogin();
                          },
                          elevation: 0,
                          color: model?.selectedLogin == model?.mobileLogin
                              ? model?.selectedColor
                              : model?.unavailableColor,
                          textColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Login with Mobile"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 390,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: model?.pageController,
                  children: [
                    LoginMailEntry(
                      model: model!,
                    ),
                    LoginMobileEntry(
                      model: model,
                    )
                  ],
                ),
              ),
              // selectedLogin == emailLogin ? LoginMailEntry() : LoginMobileEntry(),
              Center(
                child: MaterialButton(
                  height: 50,
                  minWidth: 380,
                  onPressed: () {
                    goTo(context!, const QRCodeScanLogin());
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: model.selectedColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.qr_code_scanner_outlined),
                      Text("Scan QR Code"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
