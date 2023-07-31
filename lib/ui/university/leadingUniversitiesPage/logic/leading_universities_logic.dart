import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart' show debugPrint;
import 'package:paramount_students/data/repository/leadingUniversities/leading_univesities_repo.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class LeadingUniveristiesLogic extends BaseViewModel {
  final LeadingUniversitiesRepository leadingUniversitiesRepo =
      LeadingUniversitiesRepository();

  @override
  void close() {
    // TODO: implement close
  }

  @override
  void init() {
    loadingData();
    getLeadingUniversites();
  }

  List<UniversityList> leadingUniList = [];
  bool isLeadingUniLoading = false;
  bool isLeadingUniRequestSuccessful = false;

  loadingData() {
    isLeadingUniLoading = true;
  }

  Future getLeadingUniversites() async {
    Either<Failure, List<UniversityList>> data =
        await leadingUniversitiesRepo.getLeadingUniversities();
    if (data.isRight) {
      leadingUniList = data.right;
      isLeadingUniLoading = false;
      isLeadingUniRequestSuccessful = true;
    } else {
      isLeadingUniLoading = false;
      isLeadingUniRequestSuccessful = false;
    }
  }
}
