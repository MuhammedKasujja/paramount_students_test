import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';

class CountryIconWidget extends StatelessWidget {
  final Country currentCountry;
  const CountryIconWidget({Key? key, required this.currentCountry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          foregroundImage: AssetImage(
            currentCountry.flagPath!,
          ),
          radius: 10,
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
