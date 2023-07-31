import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/places/model/country_universities_model.dart';
import 'package:paramount_students/data/repository/places/model/places_model.dart';
import 'package:paramount_students/data/repository/places/places_repo_interface.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/failure_response.dart';
import 'package:paramount_students/models/failure_model.dart';

class PlacesRepo implements PlacesRepoInterface {
  late ApiService api;

  PlacesRepo() {
    api = ApiService();
  }

  @override
  Future<Either<Failure, List<PlacesModel>>> getUniversityCountries() async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: "university-countries",
        protected: false,
      );
      if (response.statusCode == 200 || response.statusCode! == 201) {
        List<PlacesModel> data = List<PlacesModel>.from(response.response.data
            .map((value) => PlacesModel.fromJson(value))).toList();

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
  Future<Either<Failure, List<Universities>>>
      getCountryUniversities({
    required int countryId,
  }) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: "listall-universities?country_id=$countryId",
        protected: false,
      );
      if (response.statusCode == 200 || response.statusCode! == 201) {
        CountryUniversitiesModel data = CountryUniversitiesModel.fromJson(response.response.data);
        return Right(data.universities);

      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      debugPrint('$error - $stackTrace');
      return Left(DefaultFailure());
    }
  }
}
