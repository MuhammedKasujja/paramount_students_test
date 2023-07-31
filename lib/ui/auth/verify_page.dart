import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/course_program/view_model/program_view_model.dart';

import 'package:paramount_students/ui/home/home.dart';
import 'package:paramount_students/ui/auth/success_page.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key, required this.programId, this.programDocs});
  final int programId;
  final Map<String, dynamic>? programDocs;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 4)).then((_) {
    //   goTo(context, const SuccessPage());
    // });
    decideNav();
  }

  Future<void> decideNav() async {
    final model = ProgramViewModel();

    final bool applied = await model.programApplication(
        programId: widget.programId, documents: widget.programDocs);
    debugPrint('applied: $applied');

    if (applied) {
      goTo(context, const SuccessPage());
    } else {
      Navigator.pop(context);
    }
  }

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
                  height: MediaQuery.of(context).size.height * .5,
                  child: ListView(
                    children: [
                      sText(
                        'Verifying!',
                        size: 17,
                        weight: FontWeight.bold,
                        color: appBlackText,
                        align: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      sText(
                        'Your documents are currently undergoing\nverification',
                        color: appBlackText,
                        align: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const SpinKitCircle(
                        color: psColorPrimary1000,
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: TextButton(
              onPressed: () => goTo(context, const HomePage(),
                  anim: PageTransitionType.leftToRight),
              style: TextButton.styleFrom(
                // foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: const Size(375, 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 2,
                  ),
                  Text('Home Page')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
