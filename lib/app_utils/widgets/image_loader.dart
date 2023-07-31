import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final String placeholderImage;

  const ImageLoader({super.key, required this.imageUrl, required this.placeholderImage});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const AppLoader(
            color: psColorPrimary1000,
          ); // Show a loading indicator while loading
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset(
            placeholderImage); // Display a placeholder image on error
      },
    );
  }
}
