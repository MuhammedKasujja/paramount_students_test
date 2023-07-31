import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/programs/programs_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/applications/models/unversity_course.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class ApplicationsViewModel extends BaseViewModel {
  // ProgramsPaginated? pendingPrograms;
  // ProgramsPaginated? submitedPrograms;
  // ProgramsPaginated? approvedPrograms;
  // ProgramsPaginated? rejectedPrograms;

  StudentAppliedPrograms? programs;

  bool isLoading = false;
  @override
  void close() {}

  @override
  void init() {}

  Future fetchAppliedPrograms() async {
    isLoading = true;
    notifyListeners();

    final localDB = UserRepositoryImpl(
      HiveStorage(Hive.box(HiveKeys.appBox)),
    );

    final String token = localDB.getToken();

    final user = localDB.getUser();
    log('This is the token gotten fro Hive = $token');

    final ProgramsRepo programsRepo = ProgramsRepo(token);

    final res = await programsRepo.fetchAppliedPrograms(user.id.toString());

    if (res.isRight) {
      // if (programState == ProgramState.pending) {
      //   pendingPrograms = res.right;
      // }
      // if (programState == ProgramState.approved) {
      //   approvedPrograms = res.right;
      // }
      // if (programState == ProgramState.submitted) {
      //   approvedPrograms = res.right;
      // }
      // if (programState == ProgramState.rejected) {
      //   rejectedPrograms = res.right;
      // }
      programs = res.right;
      notifyListeners();
    } else {
      toastMessage(
        res.left.responseBody ?? 'An error occured',
        long: true,
      );
    }
    isLoading = false;
    notifyListeners();
  }

  List<Program> getPrograms(ProgramState programState) {
    if (programState == ProgramState.pending) {
      return programs?.enrolled ?? [];
    }
    if (programState == ProgramState.submitted) {
      return programs?.submitted ?? [];
    }
    if (programState == ProgramState.approved) {
      return programs?.accepted ?? [];
    }
    if (programState == ProgramState.rejected) {
      return programs?.rejected ?? [];
    }

    return [];
  }

  Future fecthPrograms(ProgramState programState) async {}
}
