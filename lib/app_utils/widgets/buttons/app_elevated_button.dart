import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/loaders.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final Color? textColor;
  final Color? buttonColor;
  final Color borderColor;

  const AppElevatedButton(
      {Key? key,
      this.onPressed,
      required this.label,
      required this.isLoading,
      this.buttonColor,
      required this.borderColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
          fixedSize: MaterialStateProperty.all(
            const Size(375, 48),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      child: isLoading
          ? appLoader
          : sText(label,
              color: textColor ?? Colors.white, weight: FontWeight.w500),
    );
  }
}
