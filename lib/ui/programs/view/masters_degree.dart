import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/applications/models/models.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';

class MasterDegree extends StatefulWidget {
  final List<Program> masterPrograms;

  const MasterDegree({Key? key, required this.masterPrograms})
      : super(key: key);

  @override
  State<MasterDegree> createState() => _MasterDegreeState();
}

class _MasterDegreeState extends State<MasterDegree> {
  void navigateToCourseProgram(Program programs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseProgram(
          program: programs,
        ),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: appBlackText,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(0, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: sText(
              "Master's Degree",
              weight: FontWeight.bold,
              color: appBlackText,
              align: TextAlign.left,
              size: 16,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: widget.masterPrograms.isEmpty
            ? const Center(
                child: Text(
                  "Programs not available",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: widget.masterPrograms.length,
                itemBuilder: (BuildContext context, int index) {
                  final program = widget.masterPrograms[index];
                  return ProgramTile(
                    onPressed: () {
                      navigateToCourseProgram(program);
                    },
                    icon: program.university.coverPhotoUrl,
                    program: program,
                    department: program.faculty,
                  );
                },
              ),
      ),
    );
  }
}
