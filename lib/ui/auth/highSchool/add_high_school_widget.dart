import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/auth/country_list.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';

final RegisterationViewModel registerationViewModel = RegisterationViewModel();

class AddHighSchoolWidget extends StatefulWidget {
  const AddHighSchoolWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddHighSchoolWidget> createState() => _AddHighSchoolWidgetState();
}

class _AddHighSchoolWidgetState extends State<AddHighSchoolWidget> {
  final TextEditingController highSchoolNameController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  Country currentCountry = Countries.psTR;

  @override
  Widget build(BuildContext context) {
    final bottomViewInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        top: 50.0,
        left: 10.0,
        right: 10.0,
        bottom: bottomViewInset,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.clear),
                const SizedBox(
                  width: 5,
                ),
                sText("Cancel", size: 12)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          sText(
            'Add High School Name',
            size: 30,
            weight: FontWeight.w500,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  highSchoolTextFieldWidget(
                    controller: highSchoolNameController,
                    title: 'High School',
                    hint: 'Write your official name of high school',
                    enableTextField: true,
                  ),
                  GestureDetector(
                    onTap: () async {
                      currentCountry = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CountryList(isItForMobileNumber: false);
                      }));

                      setState(() {
                        countryController.text = currentCountry.countryName!;
                      });
                    },
                    child: highSchoolTextFieldWidget(
                      controller: countryController,
                      title: 'Country',
                      hint: 'Name of your high school country name',
                      enableTextField: false,
                    ),
                  ),
                  highSchoolTextFieldWidget(
                    controller: cityController,
                    title: 'City',
                    hint: 'Name of your high school city name',
                    enableTextField: true,
                  ),
                  highSchoolTextFieldWidget(
                    controller: addressController,
                    title: 'Address',
                    hint: 'High School Street Address',
                    enableTextField: true,
                  ),
                  highSchoolTextFieldWidget(
                    controller: postalCodeController,
                    title: 'Postal Code',
                    hint: '',
                    enableTextField: true,
                  ),
                ],
              ),
            ),
          ),
          bottomViewInset > 0.0
              ? Container()
              : GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Add High School Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
        ],
      ),
    );
  }

  Widget highSchoolTextFieldWidget({
    required String title,
    hint,
    required TextEditingController controller,
    required bool enableTextField,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sText(
            title,
            size: 18,
            weight: FontWeight.w500,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            enabled: enableTextField,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.grey[100],
              filled: true,
              border: textFieldBorder(isItErrorBorder: false),
              errorBorder: textFieldBorder(isItErrorBorder: true),
              focusedBorder: textFieldBorder(isItErrorBorder: false),
              enabledBorder: textFieldBorder(isItErrorBorder: false),
              disabledBorder: textFieldBorder(isItErrorBorder: false),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  OutlineInputBorder textFieldBorder({required bool isItErrorBorder}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: isItErrorBorder == true ? Colors.red : Colors.black,
        ),
      );
}
