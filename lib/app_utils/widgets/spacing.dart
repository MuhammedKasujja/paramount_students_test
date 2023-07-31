import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  //const Spacing({Key? key, required this.height, required this.width}) : super(key: key);

  const Spacing.height(this.height, {super.key}) : width = AppDimension.zero;

  const Spacing.tinyHeight({key}) : this.height(AppDimension.tiny, key: key);

  const Spacing.extraSmallHeight({key})
      : this.height(AppDimension.extraSmall, key: key);

  const Spacing.smallHeight({key}) : this.height(AppDimension.small, key: key);

  const Spacing.meduimHeight({key})
      : this.height(AppDimension.medium, key: key);

  const Spacing.bigHeight({key}) : this.height(AppDimension.big, key: key);

  const Spacing.largeHeight({key}) : this.height(AppDimension.large, key: key);

  const Spacing.width(this.width, {super.key}) : height = AppDimension.zero;

  const Spacing.tinyWidth({key}) : this.width(AppDimension.tiny, key: key);

  const Spacing.extraSmallWidth({key})
      : this.width(AppDimension.extraSmall, key: key);

  const Spacing.smallWidth({key}) : this.width(AppDimension.small, key: key);

  const Spacing.meduimWidth({key}) : this.width(AppDimension.medium, key: key);

  const Spacing.bigWidth({key}) : this.width(AppDimension.big, key: key);

  const Spacing.largeWidth({key}) : this.width(AppDimension.large, key: key);

  const Spacing.empty({key})
      : height = AppDimension.zero,
        width = AppDimension.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
