import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';

class ProgramSlider extends StatefulWidget {
  final List<Program> programs;

  const ProgramSlider({super.key, required this.programs});

  @override
  State<ProgramSlider> createState() => _ProgramSliderState();
}

class _ProgramSliderState extends State<ProgramSlider> {
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
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 220,
      child: CarouselSlider.builder(
        itemCount: 3,
        slideTransform: const BackgroundToForegroundTransform(),
        unlimitedMode: true,
        slideBuilder: (index) {
          if (widget.programs.isEmpty) {
            return const SizedBox(height: 200);
          }
          final program = widget.programs[index];
          return ProgramTile(
            onPressed: () {
              navigateToCourseProgram(program);
            },
            icon: program.university.coverPhotoUrl,
            program: program,
            department: program.faculty,
          );
        },
        slideIndicator: CircularSlideIndicator(
          alignment: Alignment.bottomCenter,
          currentIndicatorColor: psGrey2,
          indicatorRadius: 5,
          indicatorBackgroundColor: const Color(0XFFD9D9D9),
        ),
      ),
    );
  }
}
