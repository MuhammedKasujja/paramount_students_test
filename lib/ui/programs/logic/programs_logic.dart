import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/data/repository/facultyPrograms/faculty_programs_repo.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculty_courses_model.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class ProgramsLogic extends BaseViewModel {
  final FacultyProgramsRepo programsRepo = FacultyProgramsRepo();

  @override
  void close() {
    // TODO: implement close
  }

  @override
  void init() {
    loadingRequestedData();
  }

  void faculitiesRequest() async {
    await getFaculities();
  }

  void facultyProgramsRequest({required int facultyId}) async {
    await getFacultyPrograms(facultyId: facultyId);
  }

  List<FacultiesListData> faculties = [];
  List<Program> facultyPrograms = [];

  bool isLoading = false;
  bool isRequestSuccessful = false;
  bool isItAFacultyRequest = false;

  loadingRequestedData() {
    isLoading = true;
  }

  Future getFaculities() async {
    Either<Failure, FacultiesModel> data = await programsRepo.getFaculties();
    if (data.isRight) {
      faculties = data.right.data.responseBody;
      isLoading = false;
      isRequestSuccessful = true;
      debugPrint(
          'This is the response data from the request ${faculties[0].name}');
    } else {
      isLoading = false;
      isRequestSuccessful = false;
    }
  }

  Future<List<Program>> getFacultyPrograms(
      {required int facultyId}) async {
    Either<Failure, FacultyProgramsModel> data =
        await programsRepo.getProgramsByFacultyId(
      facultyId: facultyId,
    );

    if (data.isRight) {
      facultyPrograms = data.right.data.responseBody.data;
    } else {
      facultyPrograms = [];
    }
    return facultyPrograms;
  }
}
