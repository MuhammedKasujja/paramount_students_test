import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.minLines = 1,
      this.maxLines = 1,
      this.obsecureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChanged,
      this.textInputType,
      this.textInputAction,
      this.suffixIcon,
      this.prefixIcon,
      this.borderColor,
      this.backgroundColor,
      this.borderRadius = 8,
      this.autoFocus,
      this.focusNode,
      this.onEditingComplete,
      this.onTap,
      this.initialValue,
      this.enabled});

  final String? hintText, initialValue;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool? obsecureText;

  final FormFieldValidator<String>? validateFunction;
  final void Function(String?)? onSaved, onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor, backgroundColor;
  final FocusNode? focusNode;

  final double borderRadius;
  final bool? autoFocus;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        enabled: enabled,
        autofocus: autoFocus ?? false,
        keyboardType: textInputType,
        validator: validateFunction ??
            (value) {
              return null;
            },
        onSaved: onSaved,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        initialValue: initialValue,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        controller: controller,
        obscureText: obsecureText ?? false,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: borderColor ?? appYellowText,
          suffixIconColor: borderColor ?? appYellowText,
          iconColor: borderColor ?? appYellowText,
          focusColor: borderColor ?? appYellowText,
          hoverColor: borderColor ?? appYellowText,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          fillColor: backgroundColor ?? Colors.white,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor ?? appYellowText),
          ),
        ),
      ),
    );
  }
}
