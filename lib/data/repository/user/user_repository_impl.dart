import 'dart:convert';

import 'package:paramount_students/app_utils/helper/enums.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/ui/notification/model/notificaton_model.dart';
import 'package:paramount_students/data/local_database.dart/abstractive_hive_storage.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository.dart';
import 'package:paramount_students/data/response/user_model/user.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/store.dart';


class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._storage);

  final AbstractHive _storage;

  @override
  void saveFile(PickedFile file, int index) async {
    await _storage.put(
        index == 0
            ? HiveKeys.file0
            : index == 1
                ? HiveKeys.file1
                : index == 2
                    ? HiveKeys.file2
                    : HiveKeys.file3,
        file.toMap());
  }

  @override
  PickedFile getFile(int index) {
    final response = _storage.get(index == 0
            ? HiveKeys.file0
            : index == 1
                ? HiveKeys.file1
                : index == 2
                    ? HiveKeys.file2
                    : HiveKeys.file3) ??
        {};
    PickedFile file = PickedFile.fromMap(response);
    return file;
  }

  @override
  Future removeAll() async {
    return _storage.clear();
  }

  @override
  int boxLength() {
    return _storage.length();
  }

  @override
  void deleteEntry(String key) async {
    await _storage.delete(key);
  }

  @override
  User getUser() {
    final response = _storage.get(HiveKeys.user) ?? {};
    User user = User.fromJson(
        response is String ? json.decode(response) : json.decode("$response"));

    return user;
  }

  @override
  void saveUser(User user) async {
    await _storage.put(HiveKeys.user, json.encode(user));
  }

  @override
  void saveCurrentState(CurrentState val) async {
    await _storage.put(HiveKeys.currentState, val.name);
  }

  @override
  CurrentState getCurrentState() {
    switch (_storage.get(HiveKeys.currentState) ?? CurrentState.initial.name) {
      case "loggedIn":
        return CurrentState.loggedIn;
      case "onboarded":
        return CurrentState.onboarded;
      default:
        return CurrentState.initial;
    }
  }

  @override
  void saveToken(String val) async {
    await _storage.put(HiveKeys.token, val);
  }

  @override
  String getToken() {
    return _storage.get(HiveKeys.token) ?? "";
  }
}
