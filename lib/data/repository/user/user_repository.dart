import 'package:paramount_students/app_utils/helper/enums.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/data/response/user_model/user.dart';
import 'package:paramount_students/models/file.dart';

import '../../../models/file.dart';

abstract class UserRepository {
  void saveUser(User user);
  void saveFile(PickedFile file, int index);
  int boxLength();
  void deleteEntry(String key);
  Future removeAll();
  User getUser();
  PickedFile getFile(int index);
  void saveCurrentState(CurrentState val);
  void saveToken(String val);
  String getToken();
  CurrentState getCurrentState();
}
