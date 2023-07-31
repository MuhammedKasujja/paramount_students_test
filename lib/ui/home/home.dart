import 'dart:async';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';

import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/applications/models/unversity_course.dart';

import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/course_program/views/start_application.dart';

import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/ui/home/view_model/home_view_model.dart';
import 'package:paramount_students/ui/home/widgets/program_indicator.dart';
import 'package:paramount_students/ui/home/widgets/program_slider.dart';
import 'package:paramount_students/ui/home/widgets/right_degree.dart';
import 'package:paramount_students/ui/places/study_abroad_places.dart';
import 'package:paramount_students/ui/programs/browse_program.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';
import 'package:paramount_students/ui/programs/view/bachellor_degree.dart';
import 'package:paramount_students/ui/programs/view/masters_degree.dart';

import 'package:paramount_students/ui/programs/view/online_program_list.dart';

import 'package:paramount_students/ui/shortlist/models/dummy_data.dart';
import 'package:paramount_students/ui/studyPlacesUniversities/study_places_universities.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/leading_universities_page.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/widgets/universitiesListWidget/custom_leading_universities_widget.dart';
import '../../app_utils/widgets/study_abroad_widget.dart';

import '../programs/list_program_courses.dart';

import '../university_profile/university_profile.dart';

HomeViewModel homeViewModel = HomeViewModel();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSlide = 0;
  List<Widget> slides = [];

  List<PlacesModel> places = [];
  List<FacultiesListData> faculties = [];
  List<UniversityList> leadingUniversities = [];

  String selectedBrowse = "";

  // bool isUpdateInProgress = true;

  late Timer updateTimer;

  void updateData() {
    updateTimer = Timer.periodic(
        const Duration(
          seconds: 5,
        ), (timer) {
      setState(() {});
      // if (isUpdateInProgress) {
      //   setState(() {
      //     faculties = HomeViewModel().faculties;
      //     places = HomeViewModel().places;
      //     if (!HomeViewModel().placesRequestInProgress &&
      //         !HomeViewModel().programsRequestInProgress) {
      //       isUpdateInProgress = false;
      //     }
      //   });
      // }
    });
  }

  @override
  void dispose() {
    // updateTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // updateData();
    super.initState();
  }

  List<String> degree = ['Bachelor\'s ', 'Master\'s '];

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BaseView<HomeViewModel>(
        model: HomeViewModel(),
        onModelReady: (model) => model.init(),
        onDispose: (model) => model.dispose(),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                title: sText("Home",
                    weight: FontWeight.bold, color: appBlackText, size: 20),
                iconTheme: const IconThemeData(color: appBlackText),
                actions: [
                  IconButton(
                      onPressed: () {
                        goTo(
                            context!,
                            const StartApplication(
                              programName: 'Test',
                              uniCity: 'Test',
                              uniCountry: 'Test',
                              uniName: 'Test',
                              programId: 0,
                            ));
                      },
                      icon: const Icon(Icons.book))
                ],
              ),
              drawer: const MenuDrawer(),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CarouselSlider.builder(
                                      options: CarouselOptions(
                                        // height: 200,
                                        autoPlay: true,
                                        enableInfiniteScroll: false,
                                        autoPlayAnimationDuration:
                                            const Duration(seconds: 1),
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.9,
                                        aspectRatio: 5.0,
                                        pageSnapping: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _currentSlide = index;
                                          });
                                        },
                                      ),
                                      itemCount: model!.coverPic.length,
                                      itemBuilder: (BuildContext context,
                                          int index, int index2) {
                                        debugPrint(
                                            'view: coverpic receieved is ${model.coverPic}');
                                        return CachedNetworkImage(
                                          imageUrl: model.coverPic[index],
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.amber,
                                                          BlendMode.colorBurn)),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Container(
                                            width: appWidth(context),
                                            // padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    // NetworkImage(
                                                    //   model.coverPic[index],
                                                    // ),
                                                    AssetImage(
                                                        'assets/images/home_page_banner1.png'),
                                                fit: BoxFit.fitWidth,
                                                colorFilter: ColorFilter.mode(
                                                  Colors.black38,
                                                  BlendMode.darken,
                                                ),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Stack(
                                            children: [
                                              Container(
                                                width: appWidth(context),
                                                // padding: const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/home_page_banner1.png'),
                                                    fit: BoxFit.fitWidth,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                      Colors.black38,
                                                      BlendMode.darken,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: appWidth(context),
                                                // padding: const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/home_page_banner1.png'),
                                                        fit: BoxFit.fitWidth,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                Colors.black38,
                                                                BlendMode
                                                                    .darken))),
                                              ),
                                              const Icon(Icons.error),
                                            ],
                                          ),
                                        );
                                      }),
                                  Positioned(
                                    top: 5,
                                    left: 30,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/school_logo.png',
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "University of Alberta",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Edmunton, Canada",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    bottom: 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        /// Logo
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 10,
                                        ),

                                        /// University
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "Featured",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 30, top: 5),
                                width: MediaQuery.of(context!).size.width * 0.5,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Bachelor of Science in Civil and Environmental Engineering.",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 4,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              color: HexColor("F1C111"),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Text(
                                            "On Campus",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 4,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              color: HexColor("F1C111"),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Text(
                                            "4 years (240 ECTS)",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: HexColor("EEEEFF"),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Row(
                                  children: [
                                    displayLocalImage("speaker.png", radius: 0),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: sText(
                                            "Paramount Students Highlights Activities : Achievement",
                                            color: HexColor("000024"),
                                            size: 10))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 30,
                            top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromRGBO(241, 193, 17, 0.8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Transform.rotate(
                                          angle: 180 * pi / 105,
                                          child: const Icon(Icons.send)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat(DateFormat
                                                    .YEAR_ABBR_MONTH_DAY)
                                                .format(DateTime.now()),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                          const Text(
                                            "Start Date",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "S23,732 / year",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  const Text(
                                    "S19,832 / year",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    textScaleFactor: 1,
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  MaterialButton(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    minWidth: double.infinity,
                                    onPressed: () {},
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Text(
                                      "Apply Now",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                      textScaleFactor: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // browse by program
                      FutureBuilder(
                        // future: model.getFaculities(),
                        builder: (context, asyncSnapshot) {
                          if (asyncSnapshot.hasData) {
                            faculties =
                                asyncSnapshot.data as List<FacultiesListData>;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                browseByProgramTitleWidget(
                                  context: context,
                                  isListReady: faculties.isEmpty ? false : true,
                                  allPrograms: model.allPrograms,
                                ),
                                faculties.isEmpty
                                    ? const Center(
                                        child: Text('No programs yet'),
                                      )
                                    : Container(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        height: 50,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: faculties.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return MaterialButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () async {
                                                setState(() {
                                                  selectedBrowse =
                                                      '${faculties[index].id}';
                                                  goTo(
                                                    context,
                                                    ListProgramCoursesPage(
                                                      program:
                                                          faculties[index].name,
                                                      icon: faculties[index]
                                                              .coverPhotoUrl ??
                                                          browseList[index]
                                                              .icon,
                                                      appPrograms:
                                                          model.allPrograms,
                                                      facultyId:
                                                          faculties[index].id,
                                                    ),
                                                  );
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: selectedBrowse ==
                                                              '${faculties[index].id}'
                                                          ? appYellowText
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      boxShadow: appShadow(
                                                          Colors.grey[200]!,
                                                          1,
                                                          1,
                                                          1),
                                                    ),
                                                    child: sText(
                                                        faculties[index].name,
                                                        size: 14,
                                                        weight:
                                                            FontWeight.normal,
                                                        align: TextAlign.center,
                                                        color: selectedBrowse ==
                                                                '${faculties[index].id}'
                                                            ? appBlackText
                                                            : appBlackText),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ],
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                browseByProgramTitleWidget(
                                  allPrograms: model.allPrograms,
                                  context: context,
                                  isListReady: false,
                                ),
                                asyncSnapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? const Center(
                                        child: Text('Loading programs...'),
                                      )
                                    : const Center(
                                        child: Text('No programs yet'),
                                      ),
                              ],
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // study abroad places
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: model.getUniversityCountries(),
                        builder: (context, asyncSnapshot) {
                          if (asyncSnapshot.hasData) {
                            places = asyncSnapshot.data as List<PlacesModel>;
                            faculties = model.faculties;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                studyAbroadPlacesTitleWidget(
                                  context: context,
                                  isListReady: places.isEmpty ? false : true,
                                  allPrograms: model.allPrograms,
                                ),
                                places.isEmpty
                                    ? const Center(
                                        child: Text('No study places yet!'),
                                      )
                                    : Container(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: places.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return StudyPlacesUniversities(
                                                          countryId:
                                                              places[index].id,
                                                          allPrograms:
                                                              model.allPrograms,
                                                          faculities:
                                                              model.faculties,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: StudyAbroad(
                                                    placesModel: places[index]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ],
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                studyAbroadPlacesTitleWidget(
                                  context: context,
                                  isListReady: false,
                                  allPrograms: model.allPrograms,
                                ),
                                asyncSnapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? const Center(
                                        child: Text(
                                            'Loading programs location...'),
                                      )
                                    : const Center(
                                        child: Text('No study places yet!'),
                                      ),
                              ],
                            );
                          }
                        },
                      ),
                      // right degree for you
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: sText("Right Degree For You",
                            size: 20,
                            weight: FontWeight.bold,
                            color: appBlackText),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: isLandscape
                            ? MediaQuery.of(context).size.height * 0.25
                            : MediaQuery.of(context).size.height * 0.15,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            RightDegreeCard(
                              degree: degree[0],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BachellorProgramList(
                                              onlinePrograms:
                                                  model.bachellorProgList),
                                    ));
                              },
                            ),
                            RightDegreeCard(
                              degree: degree[1],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MasterDegree(
                                          masterPrograms: model.masterProgList),
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),

                      // leading university
                      const SizedBox(
                        height: 35,
                      ),
                      FutureBuilder(
                          future: model.getLeadingUniversites(),
                          builder: (context, asyncSnapshot) {
                            if (asyncSnapshot.hasData) {
                              leadingUniversities =
                                  asyncSnapshot.data as List<UniversityList>;
                              bool isThereAnyUniProgramCount = false;
                              if (leadingUniversities.isNotEmpty) {
                                if (leadingUniversities[0]
                                            .universityBachelorCount >
                                        0 ||
                                    leadingUniversities[0]
                                            .universityDiplomaCount >
                                        0 ||
                                    leadingUniversities[0]
                                            .universityMastersCount >
                                        0 ||
                                    leadingUniversities[0].universityPHDCount >
                                        0) {
                                  isThereAnyUniProgramCount = true;
                                }
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  leadingUniversityTitleWidget(
                                    context: context,
                                    isListReady: leadingUniversities.isNotEmpty
                                        ? true
                                        : false,
                                    universityList:
                                        leadingUniversities.isNotEmpty
                                            ? leadingUniversities
                                            : [],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  leadingUniversities.isEmpty
                                      ? const Center(
                                          child: Text('No university yet'))
                                      : Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return UniversityProfile(
                                                          universityId:
                                                              leadingUniversities[
                                                                      0]
                                                                  .id,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child:
                                                    CustomLeadingUniversitesWidget(
                                                  universityLocation:
                                                      leadingUniversities[0]
                                                          .locationTitle,
                                                  universityName:
                                                      leadingUniversities[0]
                                                          .name,
                                                  universityTutionFee:
                                                      '${leadingUniversities[0].yearlyCost}',
                                                  universityBgImage:
                                                      leadingUniversities[0]
                                                          .coverPhotoUrl,

                                                  uniGoogleMapDirFunctionality:
                                                      () {},
                                                  universityBachelorCount:
                                                      leadingUniversities[0]
                                                          .universityBachelorCount,
                                                  universityDiplomaCount:
                                                      leadingUniversities[0]
                                                          .universityDiplomaCount,
                                                  universityLogoImage:
                                                      leadingUniversities[0]
                                                          .universityLogoImage,
                                                  // =======
                                                  //                       leadingUniversities[0].universityDiplomaCount ?? 0,
                                                  //                   universityLogoImage: leadingUniversities[0]
                                                  //                           .universityLogoImage ??
                                                  //                       'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/phi0fdpgiwsl6jfqrcvw',
                                                  // >>>>>>> chuks
                                                  universityMastersCount:
                                                      leadingUniversities[0]
                                                          .universityMastersCount,
                                                  universityPHDCount:
                                                      leadingUniversities[0]
                                                          .universityPHDCount,
                                                  universityStatus:
                                                      leadingUniversities[0]
                                                          .type,
                                                  isThereAnyUniProgramCount:
                                                      isThereAnyUniProgramCount,
                                                ),
                                              ),
                                              // ProgramTile(
                                              //   onPressed: () {
                                              //     ///todo: Remove this navigation
                                              //     goTo(
                                              //       context,
                                              //       UniversityProfile(
                                              //         universityId:
                                              //             leadingUniversities[0]
                                              //                 .id,
                                              //       ),
                                              //     );
                                              //   },
                                              //   image: leadingUniversities[0]
                                              //       .coverPhotoUrl,
                                              //   icon: leadingUniversities[0]
                                              //       .coverPhotoUrl,
                                              //   university:
                                              //       leadingUniversities[0].name,
                                              //   address: leadingUniversities[0]
                                              //       .address,
                                              //   isActive: leadingUniversities[0]
                                              //               .active ==
                                              //           1
                                              //       ? true
                                              //       : false,
                                              //   originalFees:
                                              //       '${leadingUniversities[0].yearlyCost}',
                                              //   program: '',
                                              //   duration: '',
                                              //   discount: 0,
                                              //   fees: leadingUniversities[0]
                                              //           .yearlyCost ??
                                              //       0,
                                              // ),
                                            ),
                                            const ProgramIndicator(),
                                          ],
                                        ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  leadingUniversityTitleWidget(
                                    context: context,
                                    isListReady: false,
                                    universityList: [],
                                  ),
                                  asyncSnapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? const Center(
                                          child:
                                              Text('Loading universities...'),
                                        )
                                      : const Center(
                                          child: Text('No university yet'),
                                        ),
                                ],
                              );
                            }
                          }),

                      const SizedBox(
                        height: 25,
                      ),
                      // popular programs
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            sText("Popular Programs",
                                size: 20,
                                weight: FontWeight.bold,
                                color: appBlackText),
                            GestureDetector(
                              onTap: () {
                                toastMessage('Coming Soon!',
                                    color: psColorPrimary1000);
                              },
                              child: sText(
                                "See all",
                                size: 16,
                                color: appBlueText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ProgramTile(
                          onPressed: () {
                            toastMessage('Coming Soon!',
                                color: psColorPrimary1000);
                          },
                          icon: null, //'assets/images/png/university_logo.png',

                          program: Program(
                            id: 678945356,
                            universityId: 456,
                            facultyId: 79965,
                            status: ProgramState.approved,
                            code: '43637',
                            name: 'Computer Science',
                            award: 'Degree',
                            duration: '4',
                            coverPhotoUrl:
                                'assets/images/png/university_image.png',
                            university: University(
                              id: 565,
                              name: 'Stanford University',
                              active: true,
                              createdAt: DateTime.now().toString(),
                              updatedAt: DateTime.now().toString(),
                              country: 'Canada',
                              city: 'Stanford, CA 94305',
                            ),
                            isActive: true,
                            faculty: 'Arts, Design & Architecture',
                            studyLocation: 'Stanford, CA 94305',
                            applicationFees: [],
                            admissionDeadlines: [],
                            tuitionFees: [],
                          ),
                          department: "Arts, Design & Architecture",
                        ),
                      ),

                      const ProgramIndicator(),
                      // online programs
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            sText("Online Programs",
                                size: 20,
                                weight: FontWeight.bold,
                                color: appBlackText),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OnlineProgramList(
                                          onlinePrograms: model.onlineProgList),
                                    ));
                              },
                              child: sText(
                                "See all",
                                size: 16,
                                color: appBlueText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: FutureBuilder<List<Program>>(
                          future: model.allOnlineProgram(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              return ProgramSlider(
                                programs: data ?? [],
                              );
                            } else {
                              return ProgramTile(
                                onPressed: () {},
                                icon:
                                    null, //'assets/images/png/university_logo.png',
                                program: Program(
                                  id: 576767,
                                  universityId: 456,
                                  facultyId: 79965,
                                  status: ProgramState.approved,
                                  code: '43637',
                                  name: 'Computer Science',
                                  award: 'Degree',
                                  duration: '4',
                                  coverPhotoUrl:
                                      'assets/images/png/university_image.png',
                                  university: University(
                                    id: 565,
                                    name: 'Stanford University',
                                    active: true,
                                    createdAt: DateTime.now().toString(),
                                    updatedAt: DateTime.now().toString(),
                                    country: 'Canada',
                                    city: 'Stanford, CA 94305',
                                  ),
                                  isActive: true,
                                  faculty: 'Arts, Design & Architecture',
                                  studyLocation: 'Stanford, CA 94305',
                                  applicationFees: [],
                                  admissionDeadlines: [],
                                  tuitionFees: [],
                                ),
                                department: "Arts, Design & Architecture",
                              );
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget browseByProgramTitleWidget({
    required BuildContext context,
    required bool isListReady,
    required AllPrograms allPrograms,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sText("Browse By Programs",
              size: 20, weight: FontWeight.bold, color: appBlackText),
          isListReady
              ? GestureDetector(
                  onTap: () {
                    goTo(
                      context,
                      BrowseProgramPage(
                        allPrograms: allPrograms,
                        faculitiesList: faculties,
                      ),
                    );
                  },
                  child: sText(
                    "See all",
                    size: 16,
                    color: appBlueText,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget studyAbroadPlacesTitleWidget({
    required BuildContext context,
    required bool isListReady,
    required AllPrograms allPrograms,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sText("Study Abroad Places",
              size: 20, weight: FontWeight.bold, color: appBlackText),
          isListReady
              ? GestureDetector(
                  onTap: () {
                    goTo(
                      context,
                      StudyAbroadPlaces(
                        places: places,
                        allPrograms: allPrograms,
                        faculities: faculties,
                      ),
                    );
                  },
                  child: sText(
                    "See all",
                    size: 16,
                    color: appBlueText,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget leadingUniversityTitleWidget({
    required BuildContext context,
    required bool isListReady,
    required List<UniversityList> universityList,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sText("Leading Universities",
              size: 20, weight: FontWeight.bold, color: appBlackText),
          isListReady
              ? GestureDetector(
                  onTap: () {
                    goTo(
                      context,
                      LeadingUniversitiesPage(
                        universityList: universityList,
                      ),
                    );
                  },
                  child: sText(
                    "See all",
                    size: 16,
                    color: appBlueText,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
