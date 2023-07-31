import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/study_abroad_widget.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/ui/studyPlacesUniversities/study_places_universities.dart';

class StudyAbroadPlaces extends StatefulWidget {
  final List<PlacesModel> places;
  final List<FacultiesListData> faculities;
  final AllPrograms allPrograms;
  const StudyAbroadPlaces({
    Key? key,
    required this.places,
    required this.allPrograms,
    required this.faculities,
  }) : super(key: key);

  @override
  State<StudyAbroadPlaces> createState() => _StudyAbroadPlacesState();
}

class _StudyAbroadPlacesState extends State<StudyAbroadPlaces> {
  List<PlacesModel> places = [];

  @override
  void initState() {
    setState(() {
      places = widget.places;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: sText("Study Abroad Places",
            weight: FontWeight.bold, color: appBlackText),
        iconTheme: const IconThemeData(color: appBlackText),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: appWidth(context) / 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: places.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StudyPlacesUniversities(
                              countryId: places[index].id,
                              allPrograms: widget.allPrograms,
                              faculities: widget.faculities,
                            );
                          },
                        ),
                      );
                    },
                    child: StudyAbroad(
                      placesModel: places[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
