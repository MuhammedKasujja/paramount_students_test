import 'package:flutter/material.dart';
import 'package:paramount_students/ui/course_program/widget/listtilewidget1.dart';

class ListViewContent extends StatefulWidget {
  final String studyLocation;
  final String programType;
  final String programName;
  final String learningMode;
  final String courseCode;
  final String programAward;
  final String courseDuration;
  final String studyLanguage;
  final String studyType;

  const ListViewContent({
    super.key,
    required this.studyLocation,
    required this.programType,
    required this.programName,
    required this.learningMode,
    required this.courseCode,
    required this.programAward,
    required this.courseDuration,
    required this.studyLanguage,
    required this.studyType,
  });

  @override
  State<ListViewContent> createState() => _ListViewContentState();
}

class _ListViewContentState extends State<ListViewContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTileWidget1(
          leading: 'Study location',
          trailing: widget.studyLocation,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Program Type',
          trailing: widget.programType,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Program name',
          trailing: widget.programName,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'learning Mode',
          trailing: widget.learningMode,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Program Code',
          trailing: widget.courseCode,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Program Award',
          trailing: widget.programAward,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Program Duration',
          trailing: widget.courseCode,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Study language',
          trailing: widget.studyLanguage,
        ),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        ListTileWidget1(
          leading: 'Study Type',
          trailing: widget.studyType,
        ),
      ],
    );
  }
}
