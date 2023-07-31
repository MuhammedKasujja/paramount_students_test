import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';

class BachellorProgramList extends StatelessWidget {
  final List<Program> onlinePrograms;

  const BachellorProgramList({super.key, required this.onlinePrograms});

  @override
  Widget build(BuildContext context) {
    void navigateToCourseProgram(Program program) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseProgram(
            program: program,
          ),
          // ),
        ),
      );
    }

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
          child: sText(
            'Bachelor Degree',
            weight: FontWeight.bold,
            align: TextAlign.left,
            color: appBlackText,
            size: 16,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: onlinePrograms.isEmpty
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
                  itemCount: onlinePrograms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final programs = onlinePrograms[index];
                    return ProgramTile(
                      icon: programs.university.coverPhotoUrl,
                      program: programs,
                      department: programs.faculty,
                      onPressed: () {
                        navigateToCourseProgram(programs);
                      },
                    );
                  },
                )),
    );
  }
}
