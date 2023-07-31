import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/app_utils/widgets/buttons/ps_card_button.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/applications/models/models.dart';
import 'package:paramount_students/ui/course_program/view_model/program_view_model.dart';
import 'package:paramount_students/ui/course_program/views/start_application.dart';
import 'package:paramount_students/ui/course_program/widget/academiccontentwidget.dart';
import 'package:paramount_students/ui/course_program/widget/admissiondeadlinecontentwidget.dart';
import 'package:paramount_students/ui/course_program/widget/applicationfeescontentwidget.dart';
import 'package:paramount_students/ui/course_program/widget/expandable_container_widget.dart';
import 'package:paramount_students/ui/course_program/widget/infowidget.dart';
import 'package:paramount_students/ui/course_program/widget/listviewcontent.dart';
import 'package:paramount_students/ui/course_program/widget/tutionfeescontentwidget.dart';

import '../../../app_utils/helper/helper.dart';
import '../view_model/program_view_model.dart';

class CourseProgram extends StatefulWidget {
  final Program program;

  const CourseProgram({
    super.key,
    required this.program,
  });

  @override
  State<CourseProgram> createState() => _CourseProgramState();
}

class _CourseProgramState extends State<CourseProgram> {
  final ProgramViewModel model = ProgramViewModel();
  @override
  void initState() {
    super.initState();
  }

  String convertListToString(List<dynamic> stringList) {
    return stringList.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
        SizedBox(
          width: isLandscape
              ? MediaQuery.of(context).size.height * 0.85
              : MediaQuery.of(context).size.width,
          height: isLandscape
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.height * 0.85,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 250,
                child: Image.network(
                  widget.program.coverPhotoUrl ??
                      'https://paramountstudents.network/static/media/Group%2015.9572629d3ad621a9bb63.webp',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const SizedBox(
                      height: 45,
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? (loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!)
                          : null,
                    );
                  },
                ),
              ),
              Positioned(
                  top: 30,
                  left: 15,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: psWhite),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  )),
              Positioned(
                top: 350,
                left: 50,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 51,
                    width: 328,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: psGrey1,
                        ),
                        color: psWhite),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Redeem Gift/Coupon Code',
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 430,
                left: 50,
                child: Row(
                  children: [
                    const Text(
                      'Recent Activity',
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'view all',
                        style: TextStyle(color: psColorPrimary1000),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 250,
                right: 10,
                left: 10,
                child: Container(
                  width: 390,
                  decoration: BoxDecoration(
                    color: psWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: psGrey1.withOpacity(0.6),
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: const Offset(0, 2))
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/university1.png',
                            width: 80,
                          ),
                          SizedBox(
                            width: 240,
                            child: Text(
                                widget.program.university!.name ??
                                    'University Name',
                                overflow: TextOverflow.ellipsis,
                                style: PSTextStyle.unselectedCountryStyle),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                'assets/images/bookmark.png',
                                color: psGrey1,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.program.name,
                            style: PSTextStyle.infoTextStyle,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        child: Divider(
                          color: psGrey1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/timefield.png',
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.program.duration,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'Duration',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/cashbag.png'),
                              const SizedBox(
                                width: 6,
                              ),
                              Column(
                                children: [
                                  Text(
                                    ' ${widget.program.tuitionFees.first.amount.toString()} / Year',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    '10% scholership 13,675\$',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/send.png',
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.program.admissionDeadlines!.first
                                              .startDate ??
                                          '2023-05-01',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 13.0),
                                      child: Text(
                                        'start Date',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/calender.png',
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.program.admissionDeadlines!.first
                                              .endDate ??
                                          '2023-05-01',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 27.0),
                                      child: Text(
                                        'End date',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                textDirection: TextDirection.ltr,
                                spacing: 2,
                                runSpacing: 6,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                children: [
                                  InfoWidget(
                                    text:
                                        widget.program.award ?? 'Program Award',
                                  ),
                                  InfoWidget(
                                    text: convertListToString(
                                        widget.program.learningMode ?? ['']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 51,
                                width: 363,
                                child: PsCardButton(
                                  buttonColor: psColorPrimary1000,
                                  buttonText: 'Apply Now',
                                  onPressed: () {
                                    goTo(
                                      context,
                                      StartApplication(
                                        programId: widget.program.id,
                                        programName: widget.program.name,
                                        uniCity:
                                            widget.program.university!.city,
                                        uniCountry:
                                            widget.program.university.country,
                                        uniName: widget.program.university.name,
                                      ),
                                    );
                                  },
                                  textColor: psWhite,
                                )),
                          ),
                        ],
                      ),
                      const Spacing.meduimHeight(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableContainer(
                      text: 'Program Details',
                      content: ListViewContent(
                        programAward: widget.program.award ?? 'Program Award',
                        learningMode: convertListToString(
                            widget.program.learningMode ?? ['']),
                        programName: widget.program.name,
                        programType: widget.program.type ?? "Program Type",
                        studyType: convertListToString(
                            widget.program.studyType ?? ['']),
                        studyLanguage: convertListToString(
                            widget.program.studyLanguage ?? ['']),
                        studyLocation: widget.program.studyLocation,
                        courseCode: widget.program.code,
                        courseDuration: widget.program.duration,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableContainer(
                      text: 'Admission Deadline',
                      content: AdmissionDeadlineContentWidget(
                        semesterName: widget.program.admissionDeadlines!.first
                                .semesterName ??
                            'Semester Name',
                        startDate: widget
                                .program.admissionDeadlines!.first.startDate ??
                            'start date',
                        endDate:
                            widget.program.admissionDeadlines!.first.endDate ??
                                'End date',
                        description: widget.program.admissionDeadlines!.first
                                .description ??
                            'Description',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableContainer(
                      text: 'Tuition Fees',
                      content: TuittionFeeList(
                        tuitionList: widget.program.tuitionFees,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableContainer(
                      text: 'Academic Requirment',
                      content: AcademicReqContentWidget(
                        description:
                            widget.program.academicDescription.toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableContainer(
                      text: 'Application Fees',
                      content: ApplicationFeesContentWidget(
                          studentType: widget
                              .program.applicationFees!.first.studentType
                              .toString(),
                          // .toString(),
                          amount: widget.program.applicationFees!.first.amount
                              .toString(),
                          description: widget
                              .program.applicationFees!.first.description
                              .toString()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 147,
          // width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 60,
                      // width: 272,
                      child: PsCardButton(
                          onPressed: () async {
                            await model.programApplication(
                                programId: widget.program.id ?? 0);
                          },
                          textColor: psBlack1,
                          buttonText: 'Apply Now',
                          buttonColor: psColorPrimary1000)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 55,
                    // width: 112,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromRGBO(
                            254,
                            237,
                            177,
                            1,
                          ),
                          // backgroundColor: Color.fromRGBO(254, 237, 177, 1),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(
                              Icons.chat,
                              color: Colors.black,
                            ),
                            Text(
                              'Chat Us',
                              style: TextStyle(color: psBlack3),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
    // return Scaffold(
    //
  }
}
