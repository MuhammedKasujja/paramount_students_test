import 'dart:developer' as logger;
import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/facultyPrograms/faculty_programs_repo.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculties_model.dart';
import 'package:paramount_students/data/repository/facultyPrograms/model/faculty_courses_model.dart';
import 'package:paramount_students/data/repository/leadingUniversities/leading_univesities_repo.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';
import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/data/repository/places/places_repo.dart';
import 'package:paramount_students/data/repository/programs/programs_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/requests/programs/filtered_programs/filtered_programs.dart';
import 'package:paramount_students/data/requests/programs/filtered_programs/filters.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class HomeViewModel extends BaseViewModel {
  List programList = [];
  List<Program> onlineProgList = [];
  List<Program> bachellorProgList = [];
  List<Program> masterProgList = [];
  AllPrograms allPrograms = const AllPrograms();
  final LeadingUniversitiesRepository leadingUniversitiesRepo =
      LeadingUniversitiesRepository();

  List<PlacesModel> places = [];
  List<FacultiesListData> faculties = [];
  List<Program> facultyPrograms = [];
  List<UniversityList> leadingUniList = [];

  final PlacesRepo universityCountriesRepo = PlacesRepo();
  final FacultyProgramsRepo programsRepo = FacultyProgramsRepo();

  List<String> coverPic = [];

  bool programsRequestInProgress = true;
  bool placesRequestInProgress = true;

  @override
  void init() {
    allOnlineProgram();
    getAllPrograms();
    bacehllorsProgram();
    mastersProgram();
    // getUniversityCountries();
  }

  @override
  void close() {}

  Future<void> getAllPrograms() async {
    final String token = localDB.getToken();
    final programsRepo = ProgramsRepo(token);

    final programs = await programsRepo.allPrograms();

    if (programs.isRight) {
      logger.log(
          'Programs gotten ${programs.right.data!.responseBody!.data!.length}');
      allPrograms = programs.right;

      programList = programs.right.data!.responseBody!.data ?? [];
      randomImagePath();
    } else if (programs.isLeft) {
      logger.log('Wrong request');
    }
  }

  Future<List<Program>> allOnlineProgram() async {
    final String token = localDB.getToken();
    final programsRepo = ProgramsRepo(token);

    const onlineModel =
        FilteredPrograms(filters: Filters(learningMode: ['Online']));

    final onlinePrograms = await programsRepo.filteredPrograms(onlineModel);

    if (onlinePrograms.isRight) {
      logger.log(
          'Online Programs gotten lengh${onlinePrograms.right.data!.responseBody!.data!.length}');

      onlineProgList = onlinePrograms.right.data!.responseBody!.data ?? [];

      return onlinePrograms.right.data!.responseBody!.data!;
    } else if (onlinePrograms.isLeft) {
      logger.log('Wrong request');
      onlineProgList = [];
      return onlineProgList;
    }
    return onlineProgList;
  }

  Future<List<Program>> mastersProgram() async {
    final String token = localDB.getToken();
    final programsRepo = ProgramsRepo(token);

    const model =
        FilteredPrograms(filters: Filters(programType: ["Master's Degree"]));

    final masterPrograms = await programsRepo.filteredPrograms(model);

    if (masterPrograms.isRight) {
      logger.log(
          'Master Programs gotten lengh${masterPrograms.right.data!.responseBody!.data!.length}');

      masterProgList = masterPrograms.right.data!.responseBody!.data ?? [];

      return masterPrograms.right.data!.responseBody!.data!;
    } else if (masterPrograms.isLeft) {
      logger.log('Wrong request');
      masterProgList = [];
      return masterProgList;
    }
    return masterProgList;
  }

  Future<List<Program>> bacehllorsProgram() async {
    final String token = localDB.getToken();
    final programsRepo = ProgramsRepo(token);

    const model =
        FilteredPrograms(filters: Filters(programType: ["Bachelor's Degree"]));

    final bachellorPrograms = await programsRepo.filteredPrograms(model);

    if (bachellorPrograms.isRight) {
      logger.log(
          'Online Programs gotten lengh${bachellorPrograms.right.data!.responseBody!.data!.length}');

      bachellorProgList =
          bachellorPrograms.right.data!.responseBody!.data ?? [];

      return bachellorPrograms.right.data!.responseBody!.data!;
    } else if (bachellorPrograms.isLeft) {
      logger.log('Wrong request');
      bachellorProgList = [];
      return bachellorProgList;
    }
    return bachellorProgList;
  }

  Future<List<PlacesModel>> getUniversityCountries() async {
    // List<PlacesModel> studyPlaces = [];
    Either<Failure, List<PlacesModel>> data =
        await universityCountriesRepo.getUniversityCountries();
    if (data.isRight) {
      places = data.right;
      placesRequestInProgress = false;
      debugPrint(
          'This is the response data from the request place ${places[0].name}');
    } else {
      places = [];
      placesRequestInProgress = false;
    }
    return places;
  }

  Future<List<FacultiesListData>> getFaculities() async {
    Either<Failure, FacultiesModel> data = await programsRepo.getFaculties();
    if (data.isRight) {
      faculties = data.right.data.responseBody;
      programsRequestInProgress = false;
      debugPrint('This is faculty request response ${faculties[0].icon}');
    } else {
      faculties = [];
      programsRequestInProgress = false;
    }
    return faculties;
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

  Future<List<UniversityList>> getLeadingUniversites() async {
    Either<Failure, List<UniversityList>> data =
        await leadingUniversitiesRepo.getLeadingUniversities();
    if (data.isRight) {
      leadingUniList = data.right;
    } else {
      leadingUniList = [];
    }
    return leadingUniList;
  }

  void randomImagePath() {
    int length = 5;

    if (programList.length < 5) {
      length = programList.length;
    }
    if (programList.isNotEmpty) {
      for (int x = 0; x < length; x++) {
        final randIndex = Random().nextInt(programList.length);
        if (programList[randIndex].coverPhotoUrl!.isNotEmpty) {
          coverPic.add(programList[randIndex].coverPhotoUrl!);
        }
      }
      logger.log('cover photo list $coverPic');
    } else {
      print('programList empty');
    }

    logger.log('progam list length ${programList.length}');
  }
}
