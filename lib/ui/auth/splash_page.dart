import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/auth/onboarding/onboarding.dart';
import 'package:paramount_students/ui/chat/views/contacts_screen.dart';

import 'package:paramount_students/utils/ps_color.dart';

/// This is a dynamic widget that can be extended to include
/// animation for the splash screen when necessary.
class PsSPlash extends StatefulWidget {
  const PsSPlash({Key? key}) : super(key: key);

  @override
  State<PsSPlash> createState() => _PsSPlashState();
}

class _PsSPlashState extends State<PsSPlash> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // Replace the Native splash with the App Splash
    // once widget initialization is done
    // We can also initialize other variables here and
    // Skip the App splash widget altogether.
    // TODO: Remove Intentional Delays for Production
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 2));

    /// TODO: Navigate on special demand
    /// e.g if user is logged in etc.
    navigateTo(context, const OnBoarding(), replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: OverflowBox(
        minWidth: 0.0,
        minHeight: 0.0,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                HexColor("#EFC111"),
                HexColor("#FF9800"),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.65,
              height: MediaQuery.of(context).size.height * 0.77,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(239, 193, 17, 0.3),
                    Color.fromRGBO(255, 152, 0, 0.3),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  backgroundBlendMode: BlendMode.screen),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.25,
              height: MediaQuery.of(context).size.height * 0.57,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.3),
                backgroundBlendMode: BlendMode.softLight,
                // boxShadow: [
                //   // BoxShadow(color: Colors.black, blurRadius: 1, spreadRadius: 0),
                //   BoxShadow(color: Color.fromRGBO(255, 152, 0, 0.3), blurRadius: 10, spreadRadius: 5),
                // ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.37,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  backgroundBlendMode: BlendMode.softLight),
            ),
            SvgPicture.asset(
              "assets/images/svg/ps_main/ps_logo.svg",
              semanticsLabel: "Paramount Students Logo",
            ),
          ]),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Powered by paramount student"),
          )
        ]),
      ),
    );
  }
}
