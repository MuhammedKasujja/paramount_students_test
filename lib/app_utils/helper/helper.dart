import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev show log;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/app_textfield.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/course_program/view_model/program_view_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paramount_students/app_utils/helper/hide.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final programViewModel = ProgramViewModel();

List<BoxShadow> elevation({required Color color, required int elevation}) {
  return [
    BoxShadow(
        color: color.withOpacity(0.6),
        offset: const Offset(0.0, 4.0),
        blurRadius: 3.0 * elevation,
        spreadRadius: -1.0 * elevation),
    BoxShadow(
        color: color.withOpacity(0.44),
        offset: const Offset(0.0, 1.0),
        blurRadius: 2.2 * elevation,
        spreadRadius: 1.5),
    BoxShadow(
        color: color.withOpacity(0.12),
        offset: const Offset(0.0, 1.0),
        blurRadius: 4.6 * elevation,
        spreadRadius: 0.0),
  ];
}

const Color sBlueGray = Color(0xFFb4bbc9);
const Color solonGray200 = Color(0xFFdadcdf);
const Color solonGray300 = Color(0xFFADB5BD);
const Color solonGray400 = Color(0xFF9ea6ad);
const Color solonGray500 = Color(0xFF757b81);
const Color solonGray600 = Color(0xFF5b5f64);
const Color solonGray700 = Color(0xFF495057);

const Color darkColor = Color(0xFF253341);

Color sDarkGray = dDarkText.withOpacity(0.8);
Color sGray = dDarkText.withOpacity(0.4);
const dDarkText = Color(0xFF1D1D1D);
const Color dTurquoise = Color(0xFF0CB8B6);
const Color dPurple = Color(0xFF9F5DE2);
const Color dMiddleBlue = Color(0xFF5C86CE);
const Color dPurpleGradientLeft = Color(0xFF7A08FA);
const Color dPurpleGradientRight = Color(0xFFAD3BFC);
const Color dRedGradientRight = Color(0xFFE5366A);
const Color dRedGradientLeft = Color(0xFFFE806F);

const appLightGray = Color(0xFFE7ECF2);
const appMainLimeGreen = Color(0xFF96a038);
const appMainLimeGreen2 = Color(0xFF75bf43);
const appMainGreen = Color(0xFF00C853);
const appMainPink = Color(0xFFb81e4f);
const appMainViolet = Color(0xFF87449a);
const appMainDarkGrey = Color(0xFF253d47);
const appMainOrange = Color(0xFFba5927);
const appGray = Color(0xFFadb4b9);
const appDarkText = Color(0xFF2F2F2F);
const appBlackText = Color(0xFF191C1C);
const appBlueText = Color(0xFF428BC1);
const appYellowText = Color(0xFFF1C111);
const bgColor = Color(0xFFF2F2F7);

displayImage(imagePath, {double radius = 30.0, double? height, double? width}) {
  return CachedNetworkImage(
      imageUrl: imagePath,
      height: height,
      width: width,
      placeholder: (context, url) {
        return radius > 0
            ? CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    const AssetImage('assets/images/home_page_banner1.png'),
                radius: radius,
              )
            : const Image(
                image: AssetImage('assets/images/home_page_banner1.png'),
              );
      },
      errorWidget: (context, url, error) {
        return radius > 0
            ? CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:
                    const AssetImage('assets/images/home_page_banner1.png'),
                radius: radius,
              )
            : const Image(
                image: AssetImage(
                  'assets/images/home_page_banner1.png',
                ),
                fit: BoxFit.fitHeight,
              );
      },
      imageBuilder: (context, image) {
        return radius > 0
            ? CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: image,
                radius: radius,
              )
            : Image(
                image: image,
                fit: BoxFit.cover,
              );
      });
}

Widget displaySQImage(imagePath,
    {double radius = 30.0, double height = 0, double width = 0}) {
  return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (context, url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          clipBehavior: Clip.hardEdge,
          child: Container(
            color: solonGray200,
            width: width,
            height: height,
          ),
        );
      },
      errorWidget: (context, url, error) => ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            clipBehavior: Clip.hardEdge,
            child: Container(
              color: solonGray200,
              width: height,
              height: height,
            ),
          ),
      imageBuilder: (context, image) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image(
              image: image,
              fit: BoxFit.cover,
              height: height,
              width: width,
            ));
      });
}

Widget displayCircularImage(imagePath, {double radius = 30.0}) {
  return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (context, url) {
        return CircleAvatar(
          backgroundColor: solonGray200,
          radius: radius,
        );
      },
      imageBuilder: (context, image) {
        return CircleAvatar(
          backgroundImage: image,
          radius: radius,
        );
      });
}

Widget displayLocalImageDevice(String filePath,
    {double radius = 30.0, double? height, double? width}) {
  File file = File(filePath);
  return radius > 20
      ? CircleAvatar(
          backgroundColor: solonGray200,
          backgroundImage: (filePath.isEmpty
              ? const AssetImage('assets/images/default.png')
              : FileImage(file)) as ImageProvider<Object>?,
          radius: radius,
        )
      : Image(
          fit: BoxFit.fitWidth,
          height: height,
          width: width,
          image: (filePath.isEmpty
              ? const AssetImage('assets/images/default.png')
              : FileImage(file)) as ImageProvider<Object>,
        );
}

displayLocalImage(String filePath,
    {double radius = 30.0, double? height, double? width}) {
  return radius > 0
      ? CircleAvatar(
          backgroundColor: solonGray200,
          backgroundImage: (filePath.isEmpty
              ? const AssetImage('assets/images/default.png')
              : AssetImage('assets/images/$filePath')),
          radius: radius,
        )
      : Image(
          fit: BoxFit.fitWidth,
          height: height,
          width: width,
          image: (filePath.isEmpty
              ? const AssetImage('assets/images/default.png')
              : AssetImage('assets/images/$filePath')));
}

Widget progress({double size = 30}) {
  return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
          backgroundColor: solonGray200,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color(0xFF00C9B9),
          )));
}

Widget sText(String? word,
    {double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = Colors.black,
    TextAlign align = TextAlign.left,
    int? maxLines = 5,
    double? lHeight = 1.2,
    String family = 'Poppins',
    FontStyle style = FontStyle.normal,
    int shadow = 0}) {
  return Text(
    word ?? '...',
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
    style: TextStyle(
      height: lHeight,
      fontStyle: style,
      color: color,
      fontFamily: family,
      fontSize: size,
      overflow: TextOverflow.ellipsis,
      fontWeight: weight,
      shadows:
          shadow > 0 ? elevation(color: Colors.black38, elevation: shadow) : [],
    ),
  );
}

Widget sText2(String? word,
    {double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = solonGray700,
    TextAlign align = TextAlign.left,
    int maxLines = 5,
    double? lHeight = 1.2,
    String family = 'ProximaRegular',
    int shadow = 0}) {
  return Text(
    word ?? '...',
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
    style: TextStyle(
      height: lHeight,
      color: color,
      fontFamily: 'ProximaRegular',
      fontSize: size,
      fontWeight: weight,
      shadows:
          shadow > 0 ? elevation(color: Colors.black38, elevation: shadow) : [],
    ),
  );
}

Widget solonOutlineButton({
  required Widget content,
  required Function onPressed,
  textColor = Colors.white,
  double z = 16,
  double radius = 5,
  int shadowStrength = 1,
  double borderWidth = 1,
  double height = 60,
  EdgeInsetsGeometry? padding,
  Color outlineColor = const Color(0xFFf2f2f2),
  Color backgroundColor = Colors.white,
  String family = 'ProximaRegular',
}) {
  return Container(
    height: height,
    decoration: shadowStrength > 0
        ? BoxDecoration(
            boxShadow:
                elevation(color: solonGray200, elevation: shadowStrength),
            borderRadius: BorderRadius.circular(radius))
        : BoxDecoration(borderRadius: BorderRadius.circular(radius)),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: outlineColor, width: borderWidth)),
      ),
      onPressed: () => onPressed(),
      child: content,
    ),
  );
}

Widget dPurpleGradientButton(
    {required Widget content,
    required Function onPressed,
    double radius = 5,
    double height = 50,
    EdgeInsetsGeometry? padding,
    List<Color> colors = const [dPurpleGradientLeft, dPurpleGradientRight],
    gradientDirection = 'left_right'}) {
  return SizedBox(
    height: height,
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: gradientDirection == 'left_right'
                ? Alignment.centerLeft
                : Alignment.topCenter,
            end: gradientDirection == 'left_right'
                ? Alignment.centerRight
                : Alignment.bottomCenter,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(radius)),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//          backgroundColor: col,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: () => onPressed(),
        child: content,
      ),
    ),
  );
}

Future goTo(BuildContext context, Widget target,
    {bool replace = false,
    PageTransitionType anim = PageTransitionType.size,
    int millis = 200,
    bool opaque = true}) {
  if (!opaque) {
    if (!replace) {
      return Navigator.of(context).push(PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (BuildContext context, animation, secondaryAnimation) =>
              target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          }));
    } else {
      return Navigator.of(context).pushReplacement(PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (BuildContext context, animation, secondaryAnimation) =>
              target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          }));
    }
  }
  if (!replace) {
    return Navigator.push(
        context,
        PageTransition(
            type: anim,
            duration: Duration(milliseconds: millis),
            alignment: Alignment.bottomCenter,
            child: target));
  } else {
    return Navigator.pushReplacement(
        context,
        PageTransition(
            type: anim,
            duration: Duration(milliseconds: millis),
            alignment: Alignment.bottomCenter,
            child: target));
  }
}

TextStyle appStyle(
    {double size = 16,
    Color? col = dDarkText,
    FontWeight weight = FontWeight.w400,
    String family = "Poppins"}) {
  return TextStyle(
      fontFamily: family, fontWeight: weight, fontSize: size, color: col);
}

EdgeInsets noPadding() {
  return EdgeInsets.zero;
}

EdgeInsets appPadding(double size) {
  return EdgeInsets.all(size);
}

InputDecoration textDecorSuffix(
    {Color fillColor = Colors.white,
    String? hint,
    Icon? icon,
    Icon? suffIcon,
    Color? suffIconColor,
    String prefix = '',
    String suffix = '',
    bool enabled = true,
    Color hintColor = Colors.grey,
    double hintSize = 16,
    bool showBorder = true,
    String label = '',
    double size = 40,
    double top = 12.0,
    double radius = 0}) {
  return InputDecoration(
    suffixIcon: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(size)),
      child: suffIcon,
    ),
    prefixIcon: icon,
    prefixText: prefix,
    suffixText: suffix,
    hintText: hint,
    hintStyle: appStyle(size: hintSize, col: hintColor),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: appDarkText.withOpacity(0.1), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(size)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: appDarkText.withOpacity(0.1), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(size)),
    ),
    labelStyle: appStyle(size: hintSize, col: hintColor),
    labelText: label,
    filled: true,
    fillColor: fillColor,
    contentPadding: EdgeInsets.fromLTRB(20.0, top, 10.0, 12.0),
  );
}

InputDecoration textDecor(
    {String hint = '',
    Widget? icon,
    String prefix = '',
    Widget? suffix,
    Widget? suffixIcon,
    bool enabled = true,
    Color? hintColor = solonGray500,
    Color? focusColor,
    Color? underLineColorColor,
    double hintSize = 16,
    bool showBorder = true,
    double radius = 4,
    String label = '',
    EdgeInsetsGeometry padding =
        const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0)}) {
  return InputDecoration(
    prefixIcon: icon,
    prefixText: prefix,
    suffix: suffix,
    suffixIcon: suffixIcon,
    hintText: hint,
    alignLabelWithHint: true,
    isDense: true,

    floatingLabelBehavior: (label.isNotEmpty && hint.isNotEmpty)
        ? FloatingLabelBehavior.never
        : FloatingLabelBehavior.auto,
    hintStyle: appStyle(size: hintSize, col: hintColor),
//    border: UnderlineInputBorder(
//      borderSide: BorderSide(color: theColor),
//    ),
    enabledBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: underLineColorColor ?? Colors.grey[100]!, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: focusColor ?? Colors.grey[100]!, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),

    labelText: label,
    labelStyle: appStyle(size: hintSize, col: hintColor),
//    filled: true,
//    fillColor: Colors.white,
    contentPadding: padding,
  );
}

InputDecoration textDecorNoBorder(
    {String? hint,
    String prefix = '',
    Widget? suffix,
    Widget? prefixIcon,
    bool enabled = true,
    double hintSize = 16,
    Color? hintColor,
    String labelText = '',
    String family = "Poppins",
    FontWeight hintWeight = FontWeight.normal,
    Color? fill,
    Color borderColor = Colors.black,
    double radius = 4,
    EdgeInsetsGeometry padding =
        const EdgeInsets.fromLTRB(20.0, 10, 20.0, 0)}) {
  return InputDecoration(
    prefixText: prefix,
    suffix: suffix,
    prefixIcon: prefixIcon,
    hintText: hint,
    labelText: labelText,
    hintStyle: appStyle(
      size: hintSize,
      col: hintColor,
      weight: hintWeight,
      family: family,
    ),
    alignLabelWithHint: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusColor: dPurple,
    enabled: enabled,
    labelStyle: appStyle(size: hintSize, col: hintColor),
    filled: true,
    fillColor: fill,
    contentPadding: padding,
  );
}

showDialogOk(
    {String? message,
    String? title = "Alert",
    BuildContext? context,
    Widget? target,
    bool? status = false,
    bool replace = false,
    bool dismiss = true}) {
  // flutter defined function
  showDialog(
    context: context!,
    barrierDismissible: dismiss,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text("$title"),
        content: Text(message!),
        actions: <Widget>[
          MaterialButton(
            child: const Text("Ok"),
            onPressed: () {
              if (status!) {
                Navigator.pop(context);
                goTo(context, target!, replace: replace);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

showSuccessfulDialog(
    {String? message, BuildContext? context, Widget? target, bool? status}) {
  // flutter defined function
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: const Text("Alert"),
        content: Text(message!),
        actions: <Widget>[
          MaterialButton(
            child: const Text("Ok"),
            onPressed: () {
              if (status!) {
                Navigator.pop(context);
                goTo(context, target!, replace: false);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

showDialogYesNo(
    {String? message,
    BuildContext? context,
    Widget? target,
    bool replace = false}) {
  // flutter defined function
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: const Text("Alert"),
        content: Text(message!),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          MaterialButton(
            child: const Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          MaterialButton(
            child: const Text("Yes"),
            onPressed: () {
              debugPrint("hey");
              Navigator.pop(context);
              goTo(context, target!, replace: replace);
            },
          ),
        ],
      );
    },
  );
}

appWidth(con) {
  return MediaQuery.of(con).size.width;
}

appHeight(con) {
  return MediaQuery.of(con).size.height;
}

List<BoxShadow> appShadow(
    Color col, double offset, double blur, double spread) {
  return [
    BoxShadow(
        blurRadius: blur,
        color: col,
        offset: const Offset(1, 2.0),
        spreadRadius: spread),
  ];
}

Future<bool> clearPrefs() async {
  var sp = await SharedPreferences.getInstance();
  sp.clear();
  return true;
}

getInDays(DateTime timestamp) {
  double days = timestamp.difference(DateTime.now()).inHours / 24;

  if (days.round() == 0) {
    return "Today";
  } else if (days.round() == 1) {
    return "Tomorrow";
  } else if (days.round() == 2) {
    return "In 2days";
  } else if (days.round() == 3) {
    return "In 3days";
  } else if (days.round() == 4) {
    return "In 4days";
  } else {
    return DateFormat.yMMMEd().format(timestamp);
  }
}

Future<bool> setPref(key, value, {type = 'string'}) async {
  var sp = await SharedPreferences.getInstance();
  debugPrint("Setting $type pref $key to $value...");
  switch (type) {
    case 'string':
      sp.setString(key, value);
      break;
    case 'bool':
      sp.setBool(key, value);
      break;
    case 'int':
      sp.setInt(key, value);
      break;
    case 'list':
      List<String> ls = value;
      sp.setStringList(key, ls);
      break;
  }
  return true;
}

Future<dynamic> getPref(key, {type = 'string'}) async {
  var sp = await SharedPreferences.getInstance();
  switch (type) {
    case 'string':
      return sp.getString(key);
      break;
    case 'bool':
      return sp.getBool(key);
      break;
    case 'list':
      List<String> aList = [];
      List<String>? data = sp.getStringList(key);
      if (data != null) {
        aList = data;
        return aList;
      } else {
        return aList;
      }
      break;
  }
}

EdgeInsets topPadding(double size) {
  return EdgeInsets.only(top: size);
}

EdgeInsets bottomPadding(double size) {
  return EdgeInsets.only(bottom: size);
}

EdgeInsets leftPadding(double size) {
  return EdgeInsets.only(left: size);
}

EdgeInsets rightPadding(double size) {
  return EdgeInsets.only(right: size);
}

EdgeInsets horizontalPadding(double size) {
  return EdgeInsets.symmetric(horizontal: size);
}

EdgeInsets verticalPadding(double size) {
  return EdgeInsets.symmetric(vertical: size);
}

properCase(String txt) {
  return txt.titleCase;
}

capCase(String txt) {
  return txt.toUpperCase();
}

sentenceCase(String txt) {
  if (txt.isEmpty) return txt;
  return txt.sentenceCase;
}

toastMessage(String text, {bool long = false, Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: color ?? dDarkText,
      textColor: Colors.white);
}

Map replaceNulls(Map m) {
  for (var i in m.keys) {
    if (m[i] is String) {
      if (m[i] == "null") {
        m[i] = '';
      }
    } else if (m[i] == Null) {
      m[i] = '';
    } else {
      m[i] = jsonEncode(m[i]);
    }
  }
  return m;
}

bool appIsEmpty(value) {
  return value.toString() == '' || value == null || value == 'null';
}

Map stripNulls(dynamic v) {
  Map m = v.toMap();
  Map<String, String> finalMap = v.toMap();
  for (var i in m.keys) {
    if (m[i] == "null") {
      finalMap.remove(i);
    }
  }
  return finalMap;
}

doDelete(String urlAfterBase) async {
  // String? token = await UserPreferences().getUserToken();
  String? token = '';
  token != null ? token = token : token = '';
  var url = Uri.parse('$base$urlAfterBase');
  debugPrint("url: $url");
  var js = await http.delete(url, headers: {'api-token': token});
  var decoded;
  if (js.statusCode == 200) {
    try {
      decoded = jsonDecode(js.body);
    } catch (e) {
      debugPrint("decoded: ${js.body}");
      debugPrint("$e");
    }
  } else {
    decoded = js.statusCode.toString();
  }
  return decoded;
}

doPost(String urlAfterBase, Map body) async {
  // String? token = await UserPreferences().getUserToken();
  String? token = '';
  token != null ? token = token : token = '';
  debugPrint('Calling $base$urlAfterBase...');
  debugPrint('body $body...');
  debugPrint('token $token...');
  var url = Uri.parse('$base$urlAfterBase');
  var decoded;
  http.Response js;
  js = await http.post(
    url,
    body: replaceNulls(body),
    headers: {'api-token': token},
  );
  debugPrint("js:${jsonEncode(js.statusCode)}");

  debugPrint("body: ${js.body}");
  try {
    decoded = jsonDecode(js.body);
  } catch (e) {
    debugPrint("post: $e");
  }
  return decoded;
}

doPut(String urlAfterBase, Map body) async {
  // String? token = await UserPreferences().getUserToken();
  String? token = '';
  token != null ? token = token : token = '';
  debugPrint('Calling $base$urlAfterBase...');
  debugPrint('body $body...');
  debugPrint('token $token...');
  var url = Uri.parse('$base$urlAfterBase');
  var decoded;
  http.Response js;
  js = await http.put(
    url,
    body: replaceNulls(body),
    headers: {'api-token': token},
  );
  debugPrint("js:${jsonEncode(js.statusCode)}");

  debugPrint("body: ${js.body}");
  try {
    decoded = jsonDecode(js.body);
  } catch (e) {
    debugPrint("post: $e");
  }
  return decoded;
}

doGet(String urlAfterBase) async {
  // String? token = await UserPreferences().getUserToken();
  String? token = '';
  token != null ? token = token : token = '';
  debugPrint("token:$token");
  var url = Uri.parse('$base$urlAfterBase');

  debugPrint("url: $url");
  debugPrint("userToken: $token");

  http.Response js;
  js = await http.get(url, headers: {'api-token': token});

  var decoded;
  debugPrint("decoded: ${js.body}");
  try {
    decoded = jsonDecode(js.body);
  } catch (e) {
    debugPrint("$e");
  }
  return decoded;
}

navigateTo(BuildContext context, Widget target,
    {bool replace = false,
    PageTransitionType anim = PageTransitionType.fade,
    int millis = 300,
    bool opaque = false}) {
  if (!replace) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (BuildContext context, animation, secondaryAnimation) =>
            target,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        }));
  } else {
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.size,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.bottomCenter,
            child: target));
  }
}

extension StringExtension on String {
  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;
    if (diffInHours < 0) {
      diffInHours = diffInHours * -1;
      if (diffInHours < 1) {
        final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
        timeValue = diffInMinutes;
        timeUnit = 'm';
      } else if (diffInHours < 24) {
        timeValue = diffInHours;
        timeUnit = 'h';
      } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
        timeValue = (diffInHours / 24).floor();
        timeUnit = 'd';
      } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
        timeValue = (diffInHours / (24 * 7)).floor();
        timeUnit = 'w';
      } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
        timeValue = (diffInHours / (24 * 30)).floor();
        timeUnit = 'm';
      } else {
        timeValue = (diffInHours / (24 * 365)).floor();
        timeUnit = 'y';
      }
      timeAgo = '$timeValue $timeUnit';
      timeAgo += timeValue > 1 ? '' : '';

      return 'in $timeAgo';
    } else {
      if (diffInHours < 1) {
        final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
        timeValue = diffInMinutes;
        timeUnit = 'm';
      } else if (diffInHours < 24) {
        timeValue = diffInHours;
        timeUnit = 'h';
      } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
        timeValue = (diffInHours / 24).floor();
        timeUnit = 'd';
      } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
        timeValue = (diffInHours / (24 * 7)).floor();
        timeUnit = 'wk';
      } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
        timeValue = (diffInHours / (24 * 30)).floor();
        timeUnit = 'mon';
      } else {
        timeValue = (diffInHours / (24 * 365)).floor();
        timeUnit = 'yr';
      }
      timeAgo = timeValue.toString() + timeUnit;
      timeAgo += timeValue > 1 ? '' : '';

      return timeAgo;
    }
  }
}

customerCare() async {
  var whatsappurlAndroid = "https://wa.me/233205177416?text=";
  var whatappurlIos = Uri.parse("https://wa.me/send?phone=233205177416&text=");
  var whatappurlCaller = Uri.parse("tel://233205177416");
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunchUrl(whatappurlIos)) {
      await launchUrl(whatappurlIos);
    } else {
      launchUrl(whatappurlCaller);
    }
  } else {
    // android , web
    if (await canLaunch(whatsappurlAndroid)) {
      await launch(whatsappurlAndroid);
    } else {
      launchUrl(whatappurlCaller);
    }
  }
}

generateRandom() {
  var rng = Random();
  var code = rng.nextInt(900000) + 100000;

  return code;
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

getOutDays(DateTime timestamp) {
  double days = DateTime.now().difference(timestamp).inHours / 24;

  if (days.round() == 0) {
    return "Today";
  } else if (days.round() == 1) {
    return "Yesterday";
  } else if (days.round() == 2) {
    return "2 days ago";
  } else if (days.round() == 3) {
    return "3 days ago";
  } else {
    return DateFormat.yMMMEd().format(timestamp);
  }
}

Future<String?> showUpdateDialog(
    BuildContext context, String val, NavigatorState navigator,
    {List<String>? countryStatesList,
    TextEditingController? controller,
    bool isDropdown = false,
    bool mandatory = false,
    bool isNumberOnly = false,
    bool isProgramView = true}) async {
  return showDialog(
    context: context,
    barrierDismissible: mandatory ? false : true,
    builder: (ctx) => isDropdown
        ? SimpleDialog(
            title: Text('Select a $val'),
            children: countryStatesList!.map((state) {
              return SimpleDialogOption(
                onPressed: () {
                  if (isProgramView == true) {
                    programViewModel.getUserChoice(state, controller!);
                  }

                  navigator.pop(state);
                },
                child: Text(state),
              );
            }).toList(),
          )
        : AlertDialog(
            scrollable: true,
            title: sText(val, weight: FontWeight.bold),
            content: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: psBlack1),
                ),
              ),
              controller: controller,
              keyboardType:
                  isNumberOnly ? TextInputType.number : TextInputType.text,
              textInputAction: TextInputAction.done,
              onSubmitted: (val) {
                if (isProgramView == true) {
                  programViewModel.getUserChoice(val, controller!);
                }

                navigator.pop(val);
              },
            ),
          ),
  );
}

class ListPrograms {
  final String? name;
  final String? icon;
  dynamic id;

  ListPrograms({
    this.name = '',
    this.icon,
    this.id,
  });
}

class ListNames2 {
  String name;
  String image;
  dynamic id;
  ListNames2({this.name = '', this.id, required this.image});
}

Future<void> downloadFile(String? url) async {
  if(url == null){
    toastMessage('File not found');
    return;
  }
  String? localPath = await _findLocalPath();
  if (localPath == null) {
    return;
  }

  await FlutterDownloader.enqueue(
    url: url,
    headers: {}, // optional: header send with url (auth token etc)
    savedDir: localPath,
    saveInPublicStorage: true,
    showNotification:
        true, // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
}

Future<String?> _findLocalPath() async {
  final directory =
      // (MyGlobals.platform == "android")
      // ?
      await getExternalStorageDirectory();
  // await getApplicationDocumentsDirectory();
  if (directory != null) {
    String localPath = '${directory.path}${Platform.pathSeparator}downloads';

    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return localPath;
  }
  return null;
}