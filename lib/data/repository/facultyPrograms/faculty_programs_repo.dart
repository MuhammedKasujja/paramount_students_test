import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/facultyPrograms/faculty_programs_repo_interface.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculty_courses_model.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/failure_response.dart';
import 'package:paramount_students/models/failure_model.dart';

class FacultyProgramsRepo implements FacultyProgramsRepoInterface {
  late ApiService api;

  FacultyProgramsRepo() {
    api = ApiService();
  }

  @override
  Future<Either<Failure, FacultiesModel>> getFaculties() async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: "faculties",
        protected: false,
      );
      if (response.statusCode == 200 || response.statusCode! == 201) {
        FacultiesModel data = FacultiesModel.fromJson(response.response.data);
        return Right(data);
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      debugPrint('$error - $stackTrace');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, FacultyProgramsModel>> getProgramsByFacultyId({
    required int facultyId,
  }) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: "programs?program_faculty=$facultyId",
        protected: false,
      );
      if (response.statusCode == 200 || response.statusCode! == 201) {
        FacultyProgramsModel data =
            FacultyProgramsModel.fromJson(response.response.data);
        return Right(data);
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      debugPrint('$error - $stackTrace');
      return Left(DefaultFailure());
    }
  }
}
