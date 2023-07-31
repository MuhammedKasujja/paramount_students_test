import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/programs/logic/programs_logic.dart';

import '../../app_utils/styles/app_images.dart';
import 'program_tile.dart';

class ListProgramCoursesPage extends StatefulWidget {
  final String? program;
  final String? icon;
  final AllPrograms appPrograms;
  final int facultyId;
  const ListProgramCoursesPage({
    required this.facultyId,
    this.program,
    this.icon,
    Key? key,
    required this.appPrograms,
  }) : super(key: key);

  @override
  State<ListProgramCoursesPage> createState() => _ListProgramCoursesPageState();
}

class _ListProgramCoursesPageState extends State<ListProgramCoursesPage> {
  final ProgramsLogic programsLogic = ProgramsLogic();

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_alt_sharp,
                ),
                const SizedBox(width: 10),
                sText(
                  "Filter",
                  weight: FontWeight.w500,
                  size: 12,
                  color: appBlackText,
                ),
              ],
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(0, 40),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(widget.icon ?? PsIcons.appliedScienceIcon),
                  height: 30,
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(width: 20),
                sText(
                  widget.program ?? 'Applied Scienc',
                  weight: FontWeight.bold,
                  color: appBlackText,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: programsLogic.getFacultyPrograms(
              facultyId: widget.facultyId,
            ),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var programListData =
                    snapshot.data as List<Program>;
                return programListData.isEmpty
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
                      itemCount: programListData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final programs = programListData[index];
                        return ProgramTile(
                          icon: PsIcons.appliedScienceIcon,
                          program: programs,
                          department: widget.program,
                          onPressed: () {
                            // navigateToCourseProgram(programs);
                          },
                        );
                      },
                    );
              } else {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  return Container();
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
