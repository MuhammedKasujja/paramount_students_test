import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/app_dimensions.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class ProgramIndicator extends StatelessWidget {
  const ProgramIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: AppDimension.small,
              width: AppDimension.small,
              decoration: BoxDecoration(
                color: psWhite,
                border: Border.all(
                  color: psGrey1,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: AppDimension.small,
              width: AppDimension.small,
              decoration: const BoxDecoration(
                color: psGrey1,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: AppDimension.small,
              width: AppDimension.small,
              decoration: const BoxDecoration(
                color: psGrey1,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
