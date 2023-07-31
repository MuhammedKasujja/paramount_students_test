import 'package:either_dart/either.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculty_courses_model.dart';
import 'package:paramount_students/models/failure_model.dart';

abstract class FacultyProgramsRepoInterface {
  Future<Either<Failure, FacultiesModel>> getFaculties();
  Future<Either<Failure, FacultyProgramsModel>> getProgramsByFacultyId({
    required int facultyId,
  });
}
