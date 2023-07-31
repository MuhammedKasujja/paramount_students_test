import 'package:flutter/material.dart';

import '../../../app_utils/helper/helper.dart';
import '../../../app_utils/styles/colors.dart';

import 'application_review.dart';

class StartApplication extends StatelessWidget {
  const StartApplication(
      {super.key,
      required this.programName,
      required this.uniName,
      required this.uniCity,
      required this.uniCountry,
      required this.programId});
  final String programName;
  final String uniName;
  final String uniCity;
  final String uniCountry;
  final int programId;

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
                top: isLandscape ? 103.5 : 90,
                left: 15,
                right: 15,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sText(
                        'Welcome to your Application',
                        size: 20,
                        weight: FontWeight.bold,
                        color: appBlackText,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .6,
                        child: ListView(
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: 'Thank you for your interest in the ',
                                  children: [
                                    TextSpan(
                                      text: programName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' program from ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$uniName, ',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$uniCity, ',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: uniCountry,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text:
                                          '. We are happy that you have chosen this course and are excited about your future success. Let\'s get started!',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: appBlackText,
                                      ),
                                    ),
                                  ]),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: appBlackText,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            sText(
                              'Before Application Submission',
                              size: 17,
                              weight: FontWeight.bold,
                              color: appBlackText,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            sText(
                              '1. Review The Eligibility Criteria For The Program. You Can Go Back To Cross-Check.\n\n2. All Fields Are Required And You Will Need To Upload All Necessary Documents.\n\n3. The University Will Contact You if There Is A Response From Them Through The Notification Center. You Will Receive An Email Confirmation.\n\n4. You Are Now Ready To Continue Your Application. Click The Continue Button After Proper Review.',
                              size: 14,
                              maxLines: 13,
                              color: appBlackText,
                            ),
                            if (isLandscape)
                              const SizedBox(
                                height: 50,
                              ),
                            if (isLandscape)
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () => goTo(
                                      context,
                                      ApplicationReview(
                                        programId: programId,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    // foregroundColor: Colors.black,
                                    // backgroundColor: Colors.amber,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fixedSize: const Size(375, 40),
                                  ),
                                  child: const Text('Continue'),
                                ),
                              ),
                            if (isLandscape)
                              const SizedBox(
                                height: 5,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(
                        width: 2,
                      ),
                      sText(
                        'Back',
                        color: appBlackText,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLandscape)
                const Positioned(
                  top: 109,
                  left: 0,
                  right: 0,
                  child: Divider(
                    color: psBlack1,
                    thickness: 1,
                  ),
                ),
              if (isLandscape)
                const Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Divider(
                    color: psBlack1,
                    thickness: 1,
                  ),
                ),
            ],
          ),
          if (!isLandscape)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(color: psGrey6),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => goTo(
                    context,
                    ApplicationReview(
                      programId: programId,
                    )),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(375, 40),
                ),
                child: const Text('Continue'),
              ),
            ),
        ],
      ),
    );
  }
}
