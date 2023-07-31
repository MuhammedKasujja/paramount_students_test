import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/response/user_model/user.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  User userData = const User();

  ProfileViewModel(){
    getUser();
  }

  @override
  void init() {
    getUser();
  }

  @override
  void close() {
    // TODO: implement close
  }

  void getUser() {
    final localDB = UserRepositoryImpl(
      HiveStorage(Hive.box(HiveKeys.appBox)),
    );

    userData = localDB.getUser();

    log('Profile Viewmodel userdata: $userData ');
  }
}
