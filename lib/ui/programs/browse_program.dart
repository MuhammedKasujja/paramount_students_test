import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/core/measureWidgetSize/measure_widget_size.dart';

import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';

import 'package:paramount_students/data/response/all_programs/all_programs.dart';

import 'package:paramount_students/ui/programs/list_program_courses.dart';
import 'package:paramount_students/ui/programs/logic/programs_logic.dart';

class BrowseProgramPage extends StatefulWidget {
  const BrowseProgramPage({
    Key? key,
    required this.faculitiesList,
    required this.allPrograms,
  }) : super(key: key);

  final AllPrograms allPrograms;
  final List<FacultiesListData> faculitiesList;
  @override
  State<BrowseProgramPage> createState() => _BrowseProgramPageState();
}

class _BrowseProgramPageState extends State<BrowseProgramPage> {
  ProgramsLogic programsLogic = ProgramsLogic();
  List<FacultiesListData> faculitiesList = [];

  @override
  void initState() {
    faculitiesList = widget.faculitiesList;
    super.initState();
  }

  List<ListNames2> browseList = [
    ListNames2(
      name: "Agriculture & Forestry",
      id: "1",
      image: 'assets/images/agriculture.png',
    ),
    ListNames2(
      name: "Applied Sciences & Professions",
      id: "2",
      image: 'assets/images/profession.png',
    ),
    ListNames2(
      name: "Arts, Design & Architecture",
      id: "3",
      image: 'assets/images/art.png',
    ),
    ListNames2(
      name: "Business & Management",
      id: "4",
      image: 'assets/images/business.png',
    ),
    ListNames2(
      name: "Computer Science & IT",
      id: "5",
      image: 'assets/images/computer.png',
    ),
    ListNames2(
      name: "Education & Training",
      id: "6",
      image: 'assets/images/education.png',
    ),
    ListNames2(
      name: "Engineering & Technology",
      id: "7",
      image: 'assets/images/engineering.png',
    ),
    ListNames2(
      name: "Environmental Studies",
      id: "8",
      image: 'assets/images/environmental.png',
    ),
    ListNames2(
      name: "Humanities",
      id: "9",
      image: 'assets/images/humanites.png',
    ),
    ListNames2(
      name: "Journalism & Media",
      id: "10",
      image: 'assets/images/media.png',
    ),
    ListNames2(
      name: "Law",
      id: "11",
      image: 'assets/images/law.png',
    ),
    ListNames2(
      name: "Medicine & Health",
      id: "12",
      image: 'assets/images/health.png',
    ),
    ListNames2(
      name: " Social Sciences",
      id: "13",
      image: 'assets/images/social.png',
    ),
    ListNames2(
      name: "Mathematics",
      id: "14",
      image: 'assets/images/maths.png',
    ),
    ListNames2(
      name: "Hospitality, Leisure & Sports",
      id: "15",
      image: 'assets/images/hospitality.png',
    ),
    ListNames2(
      name: "Others Programs",
      id: "16",
      image: 'assets/images/other.png',
    ),
  ];

  String selectedBrowse = "";

  Size childWidgetSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: MeasureSize(
          onChange: (size) {
          setState(() {
            childWidgetSize = size;
          });
        },
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 15.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_sharp,
                              color: appBlackText,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            sText(
                              "Back",
                              weight: FontWeight.w500,
                              color: appBlackText,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: sText(
                          "Browse by Programs",
                          weight: FontWeight.w600,
                          color: appBlackText,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              faculitiesList.isNotEmpty
                  ? Container(
                      height: 800,
                      color: bgColor,
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: appWidth(context) / 2,
                          childAspectRatio: 0.89,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: faculitiesList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          String rawSvg = '''${faculitiesList[index].icon}''';
                          debugPrint('this is the path $rawSvg');
                          // DrawableRoot? svgRoot;
                          // Future.delayed(const Duration()).then((value) async {
                          //   svgRoot = await svg.fromSvgString(rawSvg, rawSvg);
                          // });
                          // Picture picture = svgRoot!.toPicture();
                          // picture.toImage(20, 20);
                          return facultyListItem(
                            faculitiesList: faculitiesList,
                            index: index,
                            rawSvg: rawSvg,
                          );
                        },
                      ),
                    )
                  : FutureBuilder(
                      future: programsLogic.getFaculities(),
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          var data =
                              asyncSnapshot.data as List<FacultiesListData>;
                          return Container(
                            height: 800,
                            color: bgColor,
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 10, right: 10),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: appWidth(context) / 2,
                                childAspectRatio: 0.89,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: faculitiesList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                String rawSvg =
                                    '''${faculitiesList[index].icon}''';
                                debugPrint('this is the path $rawSvg');
                                return facultyListItem(
                                  faculitiesList: data,
                                  index: index,
                                  rawSvg: rawSvg,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.only(
                              top: childWidgetSize.height / 2,
                            ),
                            child: Center(
                                child: asyncSnapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? const CircularProgressIndicator()
                                    : const Text('No program yet!'),
                              ),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget facultyListItem({
    required List<FacultiesListData> faculitiesList,
    required int index,
    required String rawSvg,
  }) {
    return GestureDetector(
      onTap: () {
        goTo(
          context,
          ListProgramCoursesPage(
            facultyId: faculitiesList[index].id,
            icon: faculitiesList[index].icon ?? browseList[index].image,
            program: faculitiesList[index].name,
            appPrograms: widget.allPrograms,
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              faculitiesList[index].icon != null &&
                      faculitiesList[index].icon!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SvgPicture.string(
                        rawSvg,
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: appWidth(context) * 0.6,
                child: sText(
                  faculitiesList[index].name,
                  weight: FontWeight.w500,
                  size: 16,
                  color: appBlackText,
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
