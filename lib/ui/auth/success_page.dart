import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/home/home.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Positioned(
                top: isLandscape ? 80 : 250,
                left: 15,
                right: 15,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .75,
                  child: ListView(
                    children: [
                      if (!isLandscape)
                        const Icon(
                          Icons.check_circle,
                          color: psSuccess,
                          size: 100,
                        ),
                      if (isLandscape)
                        const Icon(
                          Icons.check_circle,
                          color: psSuccess,
                          size: 70,
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                      sText(
                        'Congratulations your\napplication is successful.\nWe will be in touch.',
                        size: 17,
                        weight: FontWeight.bold,
                        color: appBlackText,
                        align: TextAlign.center,
                      ),
                      if (isLandscape)
                        const SizedBox(
                          height: 40,
                        ),
                      if (isLandscape)
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () => goTo(context, const HomePage(),
                                anim: PageTransitionType.leftToRight),
                            style: ElevatedButton.styleFrom(
                              // foregroundColor: Colors.black,
                              // backgroundColor: Colors.amber,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              fixedSize: const Size(375, 40),
                            ),
                            child: const Text('Home Page'),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: GestureDetector(
                  onTap: () => goTo(context, const HomePage(),
                      anim: PageTransitionType.leftToRight),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cancel,
                        color: appBlackText,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      sText(
                        'Cancel',
                        color: appBlackText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!isLandscape)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => goTo(context, const HomePage(),
                    anim: PageTransitionType.leftToRight),
                style: ElevatedButton.styleFrom(
                  // foregroundColor: Colors.black,
                  // backgroundColor: Colors.amber,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(375, 20),
                ),
                child: const Text('Home Page'),
              ),
            ),
        ],
      ),
    );
  }
}
