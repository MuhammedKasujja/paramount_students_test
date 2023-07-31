import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';

class OnlineProgramList extends StatefulWidget {
  final List<Program> onlinePrograms;

  const OnlineProgramList({Key? key, required this.onlinePrograms})
      : super(key: key);

  @override
  State<OnlineProgramList> createState() => _OnlineProgramListState();
}

class _OnlineProgramListState extends State<OnlineProgramList> {
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
              'Online Programs',
              weight: FontWeight.bold,
              color: appBlackText,
              size: 16,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: widget.onlinePrograms.isEmpty
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
                itemCount: widget.onlinePrograms.length,
                itemBuilder: (BuildContext context, int index) {
                  final program = widget.onlinePrograms[index];
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
