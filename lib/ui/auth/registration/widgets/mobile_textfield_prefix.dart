import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/auth/country_list.dart';

import '../../../../../app_utils/countries/country_model.dart';

class MobileTextFieldPreFix extends StatefulWidget {
  const MobileTextFieldPreFix({
    super.key,
  });

  @override
  State<MobileTextFieldPreFix> createState() => _MobileTextFieldPreFixState();
}

class _MobileTextFieldPreFixState extends State<MobileTextFieldPreFix> {
  Country currentCountry = Countries.psTR;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            currentCountry = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryList(
                  currentCountry: currentCountry,
                  isItForMobileNumber: true,
                ),
              ),
            );
            setState(() {});
          },
          child: Row(
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
              sText(currentCountry.dialCode, size: 12),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: psBlack1,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          color: Colors.black,
          height: 20,
          width: 1,
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
