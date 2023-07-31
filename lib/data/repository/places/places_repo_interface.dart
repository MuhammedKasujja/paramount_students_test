import 'package:either_dart/either.dart';
import 'package:paramount_students/data/repository/places/model/country_universities_model.dart';
import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/models/failure_model.dart';

abstract class PlacesRepoInterface {
  Future<Either<Failure, List<PlacesModel>>> getUniversityCountries();
  Future<Either<Failure, List<Universities>>> getCountryUniversities({
    required int countryId,
  });
}

