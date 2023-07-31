import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/index.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/ui/auth/login/view/login.dart';
import 'package:paramount_students/ui/auth/splash_page.dart';
import 'package:paramount_students/ui/shortlist/view_model/short_list_view_model.dart';
import 'package:provider/provider.dart';

List<Widget> debugScreenAccess = const [PsSPlash(), Login(), IndexPage()];


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ParamountStudents extends StatelessWidget {
  const ParamountStudents({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Store(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShortListViewModel()..init(),
          lazy: false,
        ),
      ],      
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: PSStrings.psAppName,
            theme: ThemeData(
              primarySwatch: Colors.amber,
              colorScheme: const ColorScheme.light(
                primary: Colors.amber,
                secondary: Colors.amber,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Colors.white,
              textTheme: Theme.of(context).textTheme.apply(
                    // bodyColor: Colors.white,
                    // displayColor: Colors.white,
                    fontFamily: 'Poppins',
                  ),
            ),
            home: debugScreenAccess[0]
            // ),
      ),
    );
  }
}
