import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/extensions/validation_extension.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/app_textfield.dart';
import 'package:paramount_students/core/measureWidgetSize/measure_widget_size.dart';
import 'package:paramount_students/ui/auth/country_list.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/ui/auth/registration/widgets/country_icon_widget.dart';
import 'package:paramount_students/ui/auth/registration/widgets/mobile_textfield_prefix.dart';
import 'package:paramount_students/ui/auth/registration/widgets/reg_string_list_dropdown_field.dart';
import 'package:paramount_students/utils/ps_color.dart';

import '../../../../../app_utils/countries/country_model.dart';

class ContactForm extends StatefulWidget {
  final RegisterationViewModel model;
  const ContactForm({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final SizedBox titleSeparator = const SizedBox(
    height: 8,
  );

  final SizedBox fieldSeparator = const SizedBox(
    height: 18,
  );

  List<String> stateList = [];

  Size childWidgetSize = Size.zero;

  Country currentCountry = Countries.psTR;
  Country countryBuffer = Countries.psTR;

  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  // List<String> cityList = ['Winchester', 'FCT', 'Jos', 'Ibadan'];
  final requiredField = Text(
    ' *',
    style: TextStyle(color: HexColor('#DD3730')),
  );

  @override
  void initState() {
    for (var node in focus) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget.model.countryOfResidCont.clear();
  // }

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
        onChange: (size) {
          setState(() {
            childWidgetSize = size;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psMobile),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                prefixIcon: const MobileTextFieldPreFix(),
                controller: widget.model.mobileCont,
                validateFunction: context.validateFieldNotEmpty,
                hintText: PSStrings.psMobile,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psCitizenship),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                controller: widget.model.citizenCont,
                textInputType: TextInputType.name,
                validateFunction: context.validateFieldNotEmpty,
                focusNode: focus[0],
                hintText: PSStrings.psCitizenship,
              ),
              fieldSeparator,
              Text(PSStrings.psCountryOfResidence),
              titleSeparator,
              GestureDetector(
                onTap: () async {
                  currentCountry = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryList(
                        currentCountry: currentCountry,
                        isItForMobileNumber: false,
                      ),
                    ),
                  );
                  setState(() {});
                  await widget.model.getUserSelectedCountry(
                    countryChoice: currentCountry.name,
                    isItForContact: true,
                  );
                },
                child: AppTextField(
                  textInputAction: TextInputAction.next,
                  enabled: false,
                  textInputType: TextInputType.name,
                  prefixIcon: CountryIconWidget(currentCountry: currentCountry),
                  controller: widget.model.countryOfResidCont,
                  validateFunction: context.validateFieldNotEmpty,
                  hintText: PSStrings.psCountryOfResidenceHint,
                  focusNode: focus[1],
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: focus[1].hasFocus ? appYellowText : appGray,
                  ),
                ),
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psCityProvinceRegion),
                  requiredField,
                ],
              ),
              titleSeparator,
              RegStringListDropdownField(
                focusNode: focus[2],
                list: widget.model.countryStates,
                controller: widget.model.cityProvRegCont,
                description: 'Select City',
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psHomeAddress),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                validateFunction: context.validateFieldNotEmpty,
                controller: widget.model.homeaddCont,
                hintText: PSStrings.psHomeAddressHint,
                textInputType: TextInputType.streetAddress,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psPostalCode),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                validateFunction: context.validateFieldNotEmpty,
                controller: widget.model.postalCodeCont,
                textInputType: TextInputType.number,
              ),
              fieldSeparator,
              Visibility(
                  visible: !widget.model.doNotHavePassport,
                  child: Text(PSStrings.psPassport)),
              titleSeparator,
              Visibility(
                visible: !widget.model.doNotHavePassport,
                child: AppTextField(
                  textInputAction: TextInputAction.next,
                  validateFunction: context.validateFieldNotEmpty,
                  hintText: PSStrings.psNumberHint,
                  textInputType: TextInputType.visiblePassword,
                  controller: widget.model.passportCont,
                  focusNode: focus[3],
                  suffixIcon: IconButton(
                    onPressed: () async {
                      await showTextFieldInfo(
                        context: context,
                        noOfRowTextFieldWidgets: 9,
                        parentWidgetSize: childWidgetSize,
                        currentRowTextFieldWidgetIndex: 6,
                        data: PSStrings.psPassportInfo,
                        dataTitle: PSStrings.psPassportInfoTitle,
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: focus[3].hasFocus ? appYellowText : appGray,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.model.doNotHavePassport =
                          !widget.model.doNotHavePassport;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.model.doNotHavePassport
                            ? psColorPrimary1000
                            : psWhite),
                  ),
                  child: Text(
                    widget.model.doNotHavePassport
                        ? 'I have my passport'
                        : PSStrings.psNoPassport,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: HexColor("#191C1C"),
                        fontSize: 12),
                  ),
                ),
              ),
              Visibility(
                visible: !widget.model.doNotHavePassport,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(PSStrings.psIssueDate),
                        requiredField,
                      ],
                    ),
                    Row(
                      children: [
                        Text(PSStrings.psExpiryDate),
                        requiredField,
                      ],
                    ),
                  ],
                ),
              ),
              titleSeparator,
              Visibility(
                visible: !widget.model.doNotHavePassport,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (() async => widget.model.openDatePicker(
                            context: context,
                            isItForBOD: false,
                            isItForPassportIssueDate: true)),
                        child: AppTextField(
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          // validateFunction: context.validateFieldNotEmpty,
                          hintText: PSStrings.psDateHint,
                          controller: widget.model.issueDateCont,
                          enabled: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (() async => widget.model.openDatePicker(
                            context: context,
                            isItForBOD: false,
                            isItForPassportIssueDate: false)),
                        child: AppTextField(
                          textInputType: TextInputType.number,
                          enabled: false,
                          // validateFunction: context.validateFieldNotEmpty,
                          hintText: PSStrings.psDateHint,
                          controller: widget.model.expiryDateCont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psCountryLocalID),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                //validateFunction: context.validateFieldNotEmpty,
                controller: widget.model.countryLocalIdCont,
                focusNode: focus[4],
                hintText: PSStrings.psNumberHint,
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showTextFieldInfo(
                      context: context,
                      noOfRowTextFieldWidgets: 9,
                      parentWidgetSize: childWidgetSize,
                      currentRowTextFieldWidgetIndex: 9,
                      data: PSStrings.psCountryIdInfo,
                      dataTitle: PSStrings.psCountryIdInfoTitle,
                    );
                  },
                  icon: Icon(
                    Icons.info,
                    color: focus[4].hasFocus ? appYellowText : appGray,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
