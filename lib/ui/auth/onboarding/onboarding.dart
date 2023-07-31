import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/auth/login/view/login.dart';
import 'package:paramount_students/ui/auth/onboarding/onboard_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app_utils/styles/strings.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final firstPage = 0;
  final lastPage = 2;
  int nextPage = 0;
  Text textWidget = Text(PSStrings.psSkip);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            nextPage = page;
            if (page == firstPage) {
              textWidget = Text(PSStrings.psSkip);
            } else {
              textWidget = Text(PSStrings.psBack);
            }
          });
        },
        children: [
          OnBoardWidget(
            assetImage: "assets/images/png/onboarding1.png",
            text: PSStrings.psOnboardString01,
            page: nextPage,
          ),
          OnBoardWidget(
            assetImage: "assets/images/png/onboarding2.png",
            text: PSStrings.psOnboardString02,
            page: nextPage,
          ),
          OnBoardWidget(
            assetImage: "assets/images/png/onboarding3.png",
            text: PSStrings.psOnboardString03,
            page: nextPage,
          ),
        ],
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                width: 10.5,
                height: 10.5,
                color: Colors.white,
                rotationAngle: 180,
                borderRadius: BorderRadius.circular(24),
                dotBorder: const DotBorder(
                  width: 1.5,
                  color: Colors.white,
                ),
              ),
              dotDecoration: DotDecoration(
                width: 10.5,
                height: 10.5,
                color: Colors.transparent,
                dotBorder: const DotBorder(
                  width: 1.5,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(16),
                verticalOffset: 0,
              ),
              spacing: 8.0,
              // activeColorOverride: (i) => colors[i],
              // inActiveColorOverride: (i) => colors[i],
            ),
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.40,
                onPressed: () {
                  if (_pageController.page == firstPage) {
                    // TODO: Skip Function
                    navigateTo(context, const Login());
                  } else {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                elevation: 0,
                color: Colors.white,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: textWidget),
            const SizedBox(
              width: 44,
            ),
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.40,
              onPressed: () {
                if (_pageController.page == lastPage) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.bottomCenter,
                          child: const Login()));
                }
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              elevation: 0,
              color: Colors.amber,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(PSStrings.psNext),
            )
          ],
        ),
      )
    ]);
  }
}
