import 'package:either_dart/either.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';
import 'package:paramount_students/models/failure_model.dart';

abstract class LeadingUniversitiesRepositoryInterface {
  Future<Either<Failure, List<UniversityList>>> getLeadingUniversities();
}

