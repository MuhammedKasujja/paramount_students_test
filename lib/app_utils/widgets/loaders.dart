import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

const appLoader = Padding(
  padding: EdgeInsets.all(18.0),
  child: SpinKitCircle(
    color: psColorPrimary1000,
    size: 40,
  ),
);
