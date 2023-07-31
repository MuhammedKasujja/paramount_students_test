import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/image_loader.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';
import 'package:paramount_students/ui/shortlist/view_model/short_list_view_model.dart';
import 'package:provider/provider.dart';
import '../../../app_utils/styles/strings.dart';
import '../../app_utils/styles/app_images.dart';
import '../../core/dummy_data.dart';

/// A widget that displays a program tile.
///
/// The `ProgramTile` widget displays a program tile, which includes the program
/// name, university, address, duration, fees, and scholarship information.
///
/// The following properties are available:
///
/// * `image`: The image asset for the program tile.
/// * `icon`: The icon asset for the university.
/// * `university`: The name of the university.
/// * `address`: The address of the university.
/// * `isActive`: Whether the program is currently active.
/// * `onCampus`: Whether the program is on campus.
/// * `program`: The name of the program.
/// * `duration`: The duration of the program in years.
/// * `discount`: The percentage of scholarship available for the program.
/// * `fees`: The fees for the program.
///
/// The following example shows how to use the `ProgramTile` widget:
///
/// ```
/// ProgramTile(
///   image: 'assets/images/program_tile.png',
///   icon: 'assets/icons/university.png',
///   university: 'Stanford University',
///   address: 'Stanford, CA 94305',
///   isActive: true,
///   onCampus: true,
///   program: 'Computer Science',
///   duration: 4,
///   discount: 20,
///   fees: 50000,
/// )
/// ```
///
/// The output of the code above is a program tile that displays the following information:
///
/// * Image: A picture of Stanford University.
/// * Icon: An icon of a university.
/// * University: Stanford University.
/// * Address: Stanford, CA 94305.
/// * Is Active: True.
/// * On Campus: True.
/// * Program: Computer Science.
/// * Duration: 4 years.
/// * Discount: 20%.
/// * Fees: \$50,000.

class ProgramTile extends StatelessWidget {
  final Program program;
  final VoidCallback? onPressed;
  final String? department;
  final String? icon;
  const ProgramTile({
    super.key,
    required this.program,
    this.department,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 210,
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: program.coverPhotoUrl ?? '',
                          height: 170,
                          width: 120,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Image(
                              image: AssetImage(PsIcons.university),
                              height: 170,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: sText(
                              "${program.tuitionFees.isNotEmpty ? '${program.tuitionFees[program.tuitionFees.length - 1].scholarshipPercent}%' : '0'} scholarship",
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 10,
                              maxLines: 1,
                              align: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  icon == null
                                      ? const Image(
                                          image: AssetImage(
                                            'assets/images/png/university_logo.png',
                                          ),
                                          height: 20,
                                        )
                                      : ImageLoader(
                                          imageUrl: icon ?? PSStrings.errorLink,
                                          placeholderImage:
                                              'assets/images/png/university_logo.png',
                                        ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: screenSize.width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        sText(
                                          program.university.name,
                                          maxLines: 2,
                                          weight: FontWeight.normal,
                                          color: appBlackText,
                                          size: 10,
                                        ),
                                        sText(
                                          program.university.address,
                                          weight: FontWeight.normal,
                                          color: appGray,
                                          size: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Consumer<ShortListViewModel>(
                                  builder: (context, model, child) => InkWell(
                                    onTap: () {
                                      model.addToShortList(
                                        ShortListModel(
                                          id: program.id.toString(),
                                          dept: department ??
                                              'Arts, Design & Architecture',
                                          university: program.university.name,
                                          univeristyLocation:
                                              program.university.address!,
                                          amount: int.parse(program
                                              .tuitionFees.first.amount!),
                                          date:
                                              DateFormat('dd MMM yyyy').format(
                                            program.createdAt != null
                                                ? DateTime.parse(
                                                    program.createdAt!)
                                                : DateTime.now(),
                                          ),
                                          programId: program.id.toString(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      model.isShortListItem(
                                              program.id.toString())
                                          ? Icons.bookmark
                                          : Icons.bookmark_outline,
                                      size: 18,
                                      color: model.isShortListItem(
                                              program.id.toString())
                                          ? appBlackText
                                          : appGray,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          sText(
                            program.name,
                            size: 11,
                            maxLines: 2,
                            weight: FontWeight.w600,
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: appYellowText,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: sText(
                                  "${program.learningMode?[0]}",
                                  size: 8,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: appYellowText,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: sText(
                                  "${program.duration} (${program.programECTS} ECTS)",
                                  size: 8,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$${program.tuitionFees.isNotEmpty ? program.tuitionFees.first.amount : ''} / year",
                            style: const TextStyle(
                              fontSize: 12,
                              color: appGray,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  sText(
                                    program.tuitionFees.isNotEmpty
                                        ? "\$${calculateDiscountAmount(discount: double.tryParse(program.tuitionFees.first.scholarshipPercent.toString()), amount: double.tryParse(program.tuitionFees.first.amount.toString()))}/ year"
                                        : '/ year',
                                    weight: FontWeight.w600,
                                  ),
                                  const Material(
                                    elevation: 2,
                                    color: appYellowText,
                                    child: SizedBox(
                                      width: 110,
                                      height: 1.5,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  sText(
                                    program.isActive ? "On" : "off",
                                    size: 8,
                                    weight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: program.isActive
                                        ? appMainGreen
                                        : appMainPink,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // const Expanded(
                    //   child: Align(
                    //     alignment: AlignmentDirectional.topEnd,
                    //     child: Icon(
                    //       Icons.bookmark_outline,
                    //       size: 18,
                    //       color: appGray,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
