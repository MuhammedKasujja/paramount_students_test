import '../app_utils/widgets/study_abroad_widget.dart';

List<UniversityLocation> dummyLocation = [
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
  UniversityLocation('assets/images/turkey.png', "Turkey", 70),
];

/// Calculates the discount amount for a given amount and discount.
///
/// @param amount The amount to be discounted.
/// @param discount The discount percentage.
/// @return The discount amount.
int calculateDiscountAmount({
  double? amount,
  double? discount,
}) {
  // Calculate the discount amount.
  double discountAmount = amount! - (amount * (discount! / 100));

  // Convert the discount amount to an integer.
  return discountAmount.toInt();
}
