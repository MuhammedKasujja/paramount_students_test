import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ShortListModelAdapter());
  await Hive.openBox(HiveKeys.appBox);
  await FlutterDownloader.initialize(
    // debug: true, // optional: set to false to disable printing logs to console (default: true)
    // ignoreSsl: false // option: set to false to disable working with http links (default: false)
  );
  // FlutterDownloader.registerCallback(TestClass.callback);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  HttpOverrides.global = MyHttpOverrides();
  runApp(const ParamountStudents());
}

class TestClass{
     static void callback(String id, int status, int progress) {}
}

