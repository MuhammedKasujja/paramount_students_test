import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isRequired;
  const DetailsItem({
    super.key,
    required this.title,
    required this.value,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         sText(title, color: HexColor('#191C1C')),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 14, bottom: 14, left: 20),
          decoration: BoxDecoration(
              color: HexColor("#EDF4F9"),
              borderRadius: BorderRadius.circular(8),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: sText(value, color: HexColor('#191C1C')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Icon(
                  Icons.lock,
                  color: HexColor('#767A7D'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
