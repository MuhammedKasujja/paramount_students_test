import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/data/repository/places/model/country_universities_model.dart';
import 'package:paramount_students/data/repository/places/places_repo.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class PlaceUniversitiesLogic extends BaseViewModel {
  final PlacesRepo universityCountriesRepo = PlacesRepo();

  List<Universities> universities = [];

  @override
  void close() {
    // TODO: implement close
  }

  @override
  void init() {}

  Future<List<Universities>> getCountryUniversities({
    required int countryId,
  }) async {
    Either<Failure, List<Universities>> data =
        await universityCountriesRepo.getCountryUniversities(
      countryId: countryId,
    );
    debugPrint('This is the data state ${data.isRight}');
    if (data.isRight) {
      universities = data.right;
    } else {
      universities = [];
    }
    return universities;
  }
}
