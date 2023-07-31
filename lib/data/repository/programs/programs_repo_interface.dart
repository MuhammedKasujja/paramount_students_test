import 'package:either_dart/either.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/programs/filtered_programs/filtered_programs.dart';
import 'package:paramount_students/data/requests/programs/program_application_model.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/data/response/programs/program_app_res.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/ui/applications/models/models.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';

abstract class ProgramRepoIntl {
  Future<Either<ProgramAppRes, ProgramAppRes>> programApplication(
      ProgramApplicationModel programApplicationModel);
  Future<Either<ProgramAppRes, ProgramAppRes>> updateDocumentForm(
      DocumentUploadFormModel documentUploadFormModel);
  Future<Either<ProgramAppRes, ProgramsPaginated>> fetchPrograms(
      ProgramState programState);
  Future<Either<Failure, AllPrograms>> allPrograms();
  Future<Either<Failure, AllPrograms>> filteredPrograms( FilteredPrograms filterPrograms);

    Future<Either<ProgramAppRes, StudentAppliedPrograms>> fetchAppliedPrograms(String studentId);
  
}
