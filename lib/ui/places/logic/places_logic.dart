import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/data/repository/places/places_repo.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class PlacesLogic extends BaseViewModel {
  final PlacesRepo universityCountriesRepo = PlacesRepo();

  @override
  void close() {
    // TODO: implement close
  }

  @override
  void init() {
    loadingRequestedData();
  }

  void faculitiesRequest() async {
    await getUniversityCountries();
  }

  List<PlacesModel> places = [];

  bool isLoading = false;
  bool isRequestSuccessful = false;

  loadingRequestedData() {
    isLoading = true;
    getUniversityCountries();
  }

  Future getUniversityCountries() async {
    Either<Failure, List<PlacesModel>> data =
        await universityCountriesRepo.getUniversityCountries();
    if (data.isRight) {
      places = data.right;
      isLoading = false;
      isRequestSuccessful = true;
      debugPrint(
          'This is the response data from the request ${places[0].name}');
    } else {
      isLoading = false;
      isRequestSuccessful = false;
    }
  }
}
