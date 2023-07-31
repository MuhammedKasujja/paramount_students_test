import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/leadingUniversities/leading_universities_repo_interface.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/failure_response.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';

class LeadingUniversitiesRepository
    implements LeadingUniversitiesRepositoryInterface {
  late ApiService api;

  LeadingUniversitiesRepository() {
    api = ApiService();
  }

  @override
  Future<Either<Failure, List<UniversityList>>> getLeadingUniversities() async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: "listall-universities",
        protected: false,
      );
      if (response.statusCode == 200 || response.statusCode! == 201) {
        UniversitiesModel data =
            UniversitiesModel.fromJson(response.response.data);
        List<UniversityList> universityList = data.universityList;
        return Right(universityList);
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      debugPrint('$error - $stackTrace');
      return Left(DefaultFailure());
    }
  }
}
