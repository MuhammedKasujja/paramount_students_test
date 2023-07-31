import 'package:flutter/material.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/widgets/leading_universities_header.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/widgets/universitiesListWidget/universities_list.dart';

class LeadingUniversitiesPage extends StatelessWidget {
 final List<UniversityList> universityList;
  const LeadingUniversitiesPage({super.key, required this.universityList,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadingUniversitiesHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 20.0,
                  ),
                  child: UniversitiesList(
                    universityList: universityList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
