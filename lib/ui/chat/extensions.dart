import 'enum_constants.dart';

extension MessageExtension on MessageStatus {
  String toNameString() {
    return toString().split('.').last.replaceAll('_', ' ');
  }
}

extension ActionExtension on UserActions {
  String toNameString() {
    return toString().split('.').last.replaceAll('_', ' ');
  }
}
