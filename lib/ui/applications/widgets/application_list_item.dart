import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

import '../models/models.dart';
import 'action_button.dart';

class ApplicationProgramItem extends StatelessWidget {
  final Program program;
  const ApplicationProgramItem({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 134,
                        height: 174,
                        child: CachedNetworkImage(
                          imageUrl: program.coverPhotoUrl ??
                              "https://neoslibraries.ca/wp-content/uploads/2/files/sites/2/2023/02/2021-report-teaser.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              color: Colors.black.withOpacity(0.1),
                              child: sText(
                                "${program.tuitionFees.isNotEmpty ? '${program.tuitionFees[program.tuitionFees.length - 1].scholarshipPercent}%' : 'No'} scholarship",
                                size: 10,
                                color: Colors.white,
                                weight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CachedNetworkImage(
                                    imageUrl: program
                                            .university.coverPhotoUrl ??
                                        "https://neoslibraries.ca/wp-content/uploads/2/files/sites/2/2023/02/2021-report-teaser.jpg",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sText(
                                      program.university.name,
                                      size: 12,
                                      maxLines: 2,
                                      color: appBlackText,
                                      weight: FontWeight.normal,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    sText(
                                      "${program.university.city},${program.university.country}",
                                      weight: FontWeight.normal,
                                      color: appGray,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            (program.status == ProgramState.pending ||
                                    program.status == ProgramState.submitted)
                                ? InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.delete,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          program.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          width: double.infinity,
                          color: Colors.grey,
                          height: .8,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                program.studyLocation,
                                style: const TextStyle(fontSize: 8),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: sText(
                                "${program.duration} (${program.programECTS} ETCS)",
                                size: 8,
                                weight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                program.tuitionFees.length > 1
                                    ? Text(
                                        "\$${program.tuitionFees[program.tuitionFees.length - 2].amount} / Year",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: appGray,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "\$${program.tuitionFees.isNotEmpty ? program.tuitionFees[program.tuitionFees.length - 1].amount : ''} / Year",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.transparent,
                                    shadows: const [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -10),
                                      )
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).primaryColorLight,
                                    decorationThickness: 3,
                                  ),
                                ),
                              ],
                            ),
                            program.status == ProgramState.rejected
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "On",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4.0),
                                          width: 6.0,
                                          height: 6.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0Xff39B549),
                                            shape: BoxShape.circle,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            program.status == ProgramState.rejected
                ? const SizedBox.shrink()
                : ActionButton(
                    program: program,
                  ),
          ],
        ),
      ),
    );
  }
}
