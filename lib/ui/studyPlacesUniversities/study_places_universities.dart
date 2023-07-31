import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/places/model/country_universities_model.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/ui/programs/browse_program.dart';
import 'package:paramount_students/ui/studyPlacesUniversities/logic/place_universities_logic.dart';
import 'package:paramount_students/ui/studyPlacesUniversities/widget/study_place_university_widget.dart';

class StudyPlacesUniversities extends StatefulWidget {
  final int countryId;
  final List<FacultiesListData> faculities;
  final AllPrograms allPrograms;
  const StudyPlacesUniversities({
    Key? key,
    required this.countryId,
    required this.allPrograms,
    required this.faculities,
  }) : super(key: key);

  @override
  State<StudyPlacesUniversities> createState() =>
      _StudyPlacesUniversitiesState();
}

class _StudyPlacesUniversitiesState extends State<StudyPlacesUniversities> {
  PlaceUniversitiesLogic placeUniversitiesLogic = PlaceUniversitiesLogic();

  int countryId = 0;

  @override
  void initState() {
    setState(() {
      countryId = widget.countryId;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: sText("Univerisities",
            weight: FontWeight.bold, color: appBlackText),
        iconTheme: const IconThemeData(color: appBlackText),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: FutureBuilder(
            future: placeUniversitiesLogic.getCountryUniversities(
              countryId: countryId,
            ),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                var universityAsyncData =
                    asyncSnapshot.data as List<Universities>;
                return universityAsyncData.isEmpty
                    ? const Center(
                        child: Text('No university yet!'),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: appWidth(context) / 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: universityAsyncData.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return BrowseProgramPage(
                                      faculitiesList: widget.faculities,
                                      allPrograms: widget.allPrograms,
                                    );
                                  }),
                                );
                              },
                              child: StudyPlaceUniversityWidget(
                                universitiesModel: universityAsyncData[index],
                              ),
                            );
                          },
                        ),
                      );
              } else {
                return asyncSnapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Center(
                        child: Text('No programs yet'),
                      );
              }
            }),
      ),
    );
  }
}
