import 'package:paramount_students/models/failure_model.dart';

import '../../app_utils/styles/strings.dart';
import 'base_response.dart';

class FailureResponse extends ResponseModel {
  FailureResponse(super.response);
}

extension ToDomain on FailureResponse {
  Failure toDomain() {
    return Failure(
      response.statusCode ?? -1,
      response.data ?? [PSStrings.psDefaultFailureString],
    );
  }
}