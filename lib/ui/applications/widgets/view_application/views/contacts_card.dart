import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';

import '../details_item.dart';
import 'base_collapse_card.dart';

class ContactsCard extends StatelessWidget {
  const ContactsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ProfileViewModel();
    return BaseCollapseCard(
      title: PSStrings.psContacts,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsItem(
            title: 'Mobile',
            value: model.userData.contact?.phone ?? '',
          ),
          DetailsItem(
              title: 'Citizenship',
              value: model.userData.contact?.citizen ?? ''),
          DetailsItem(
            title: 'Country Local ID Number',
            value: model.userData.contact?.passportInfo?.countryId ?? '',
          ),
          DetailsItem(
            title: 'City, Province, Region',
            value: model.userData.contact?.cityRegion ?? '',
            isRequired: true,
          ),
          DetailsItem(
            title: 'Country Of Residence',
            value: model.userData.contact?.countryResidence ?? '',
            isRequired: true,
          ),
          DetailsItem(
            title: 'Home Address',
            value: model.userData.contact?.homeAddress ?? '',
            isRequired: true,
          ),
          DetailsItem(
            title: 'Postal Code',
            value: model.userData.contact?.postalCode ?? '',
            isRequired: true,
          ),
          DetailsItem(
            title: 'Passport',
            value: model.userData.contact?.passportInfo?.number ?? '',
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("I don't have my passport yet"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: DetailsItem(
                  title: 'Issue Date',
                  value: model.userData.contact?.passportInfo?.issueDate ?? '',
                  isRequired: true,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
               Flexible(
                child: DetailsItem(
                  title: 'Expiry Date',
                  value: model.userData.contact?.passportInfo?.expiryDate ?? '',
                  isRequired: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
