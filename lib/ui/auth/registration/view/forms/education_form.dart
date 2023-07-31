import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/extensions/validation_extension.dart';
import 'package:paramount_students/core/measureWidgetSize/measure_widget_size.dart';
import 'package:paramount_students/models/high_school_model/high_school_model.dart';
import 'package:paramount_students/ui/auth/highSchool/high_school_list_page.dart';
import '../../../../../app_utils/countries/countries.dart';
import '../../../../../app_utils/countries/country_model.dart';
import '../../../../../app_utils/helper/helper.dart';
import '../../../../../app_utils/styles/strings.dart';
import '../../../../../app_utils/widgets/app_textfield.dart';
import '../../../../../utils/ps_color.dart';
import '../../../country_list.dart';
import '../../../year_language_list_widget.dart';
import '../../view_model/registeration_view_model.dart';
import '../../widgets/country_icon_widget.dart';
import '../../widgets/reg_string_list_dropdown_field.dart';

class EducationForm extends StatefulWidget {
  const EducationForm({
    Key? key,
    required this.model,
  }) : super(key: key);
  final RegisterationViewModel model;

  @override
  State<EducationForm> createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  final SizedBox titleSeparator = const SizedBox(
    height: 8,
  );

  final SizedBox fieldSeparator = const SizedBox(
    height: 18,
  );

  final requiredField = Text(
    ' *',
    style: TextStyle(color: HexColor('#DD3730')),
  );

  Country currentCountry = Countries.psTR;
  Country countryBuffer = Countries.psTR;

  Size childWidgetSize = Size.zero;

  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<String> hightSchoolCityList = ['Delta', 'Lagos', 'Imo', 'Abuja'];

  List<String> yearOfGradList = [];

  List<String> studyLangList = [
    'English',
    'French',
    'Spanish',
    'Dutsh',
    'Portugal'
  ];

  String yearOfGradTxt = '';
  String studyLangTxt = '';

  HighSchoolModel? selectedSchoolValue;

  List<HighSchoolModel> highSchoolList = [];

  late Timer updateRequiredListsTimer;

  @override
  void initState() {
    for (var focusNode in focus) {
      focusNode.addListener(() {
        setState(() {});
      });
    }
    updateRequiredList();
    for (var i = 1990; i <= 2023; i++) {
      yearOfGradList.add('$i');
    }
    yearOfGradList.reversed.toList();
    super.initState();
  }

  void updateRequiredList() {
    updateRequiredListsTimer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        // yearOfGradList = widget.model.gradYearList;
        // studyLangList = widget.model.studyLangList;
        highSchoolList = widget.model.highSchoolList;
      });
    });
  }

  @override
  void dispose() {
    updateRequiredListsTimer.cancel();
    // widget.model.highSchCountryCont.clear();
    super.dispose();
  }

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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              fieldSeparator,
              Row(
                children: [
                  sText(PSStrings.psHighSchoolCountry),
                  requiredField,
                ],
              ),
              titleSeparator,
              GestureDetector(
                onTap: () async {
                  currentCountry = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryList(
                          currentCountry: currentCountry,
                          isItForMobileNumber: false,
                          previousSelectedCountry: countryBuffer,
                        ),
                      ));

                  await widget.model.getUserSelectedCountry(
                    countryChoice: currentCountry.name!,
                    isItForContact: false,
                  );
                  setState(() {
                    countryBuffer = currentCountry;
                  });
                },
                child: AppTextField(
                  enabled: false,
                  textInputType: TextInputType.name,
                  prefixIcon: CountryIconWidget(currentCountry: currentCountry),
                  focusNode: focus[0],
                  validateFunction: context.validateFieldNotEmpty,
                  hintText: PSStrings.psHighSchoolCountryHint,
                  controller: widget.model.highSchCountryCont,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: focus[0].hasFocus ? appYellowText : appGray,
                  ),
                ),
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psHighSchoolCity),
                  requiredField,
                ],
              ),
              titleSeparator,
              // AppTextField(
              //   textInputType: TextInputType.name,
              //   controller: widget.model.hightSchCityCont,
              //   validateFunction: context.validateFieldNotEmpty,
              //   focusNode: focus[1],
              //   suffixIcon: Icon(
              //     Icons.arrow_drop_down,
              //     color: focus[1].hasFocus ? appYellowText : appGray,
              //   ),
              //   hintText: PSStrings.psHighSchoolCityHint,
              // ),
              RegStringListDropdownField(
                focusNode: focus[1],
                list:
                    //  widget.model.countryStates.isEmpty
                    // ? hightSchoolCityList
                    // :
                    widget.model.statesBuffer,
                controller: widget.model.hightSchCityCont,
                description: PSStrings.psHighSchoolCityHint,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psHighSchool),
                  requiredField,
                ],
              ),
              titleSeparator,
              GestureDetector(
                onTap: () async {
                  selectedSchoolValue = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return HighSchoolListPage(
                      requiredList: highSchoolList,
                    );
                  }));
                  setState(() {});
                  await widget.model.getUserSelectedHighSchoolChoice(
                    highSchoolChoice: selectedSchoolValue!,
                  );
                },
                child: AppTextField(
                  enabled: false,
                  controller: widget.model.highSchCont,
                  textInputType: TextInputType.name,
                  validateFunction: context.validateFieldNotEmpty,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: focus[2].hasFocus ? appYellowText : appGray,
                  ),
                  focusNode: focus[2],
                  hintText: PSStrings.psHighSchoolHint,
                ),
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psExpectedGraduation),
                  requiredField,
                ],
              ),
              titleSeparator,
              GestureDetector(
                onTap: () async {
                  yearOfGradTxt = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YearLanguageListWidgetPage(
                        isItForYear: true,
                        requiredList: yearOfGradList,
                      ),
                    ),
                  );
                  setState(() {});
                  await widget.model.getUserSelectedYearLangChoice(
                    choice: yearOfGradTxt,
                    isItForYear: true,
                  );
                },
                child: AppTextField(
                  enabled: false,
                  controller: widget.model.yearOfGradCont,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.datetime,
                  validateFunction: context.validateFieldNotEmpty,
                  focusNode: focus[3],
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: focus[3].hasFocus ? appYellowText : appGray,
                  ),
                  hintText: PSStrings.psExpectedGraduationHint,
                ),
              ),
              fieldSeparator,
              Text(PSStrings.psStudentIDNumber),
              titleSeparator,
              AppTextField(
                controller: widget.model.stuIDNoCont,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validateFunction: context.validateFieldNotEmpty,
                focusNode: focus[4],
                suffixIcon: IconButton(
                  onPressed: () async {
                    // debugPrint(
                    //     'this is the height of this widget ${context.height} of size $childWidgetSize');
                    await showTextFieldInfo(
                      context: context,
                      noOfRowTextFieldWidgets: 7,
                      parentWidgetSize: childWidgetSize,
                      currentRowTextFieldWidgetIndex: 5,
                      data: PSStrings.psStudentIdInfo,
                      dataTitle: PSStrings.psStudentIdInfoTitle,
                    );
                  },
                  icon: Icon(
                    Icons.info,
                    color: focus[4].hasFocus ? appYellowText : appGray,
                  ),
                ),
                hintText: PSStrings.psStudentIDNumberHint,
              ),
              fieldSeparator,
              Text(PSStrings.psMajors),
              titleSeparator,
              AppTextField(
                controller: widget.model.majorsCont,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.name,
                validateFunction: context.validateFieldNotEmpty,
                suffixIcon: IconButton(
                  onPressed: () async {
                    // debugPrint(
                    //     'this is the height of this widget 2 ${context.height} of size $childWidgetSize');
                    await showTextFieldInfo(
                      context: context,
                      noOfRowTextFieldWidgets: 7,
                      parentWidgetSize: childWidgetSize,
                      currentRowTextFieldWidgetIndex: 6,
                      isItForEduMajor: true,
                      data: PSStrings.psMajorInfo,
                      dataTitle: PSStrings.psMajorInfoTitle,
                    );
                  },
                  icon: Icon(
                    Icons.info,
                    color: focus[5].hasFocus ? appYellowText : appGray,
                  ),
                ),
                focusNode: focus[5],
                hintText: PSStrings.psMajorsHint,
              ),
              fieldSeparator,
              Text(PSStrings.psStudyLanguage),
              titleSeparator,
              GestureDetector(
                onTap: () async {
                  studyLangTxt = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YearLanguageListWidgetPage(
                        isItForYear: true,
                        requiredList: studyLangList,
                      ),
                    ),
                  );
                  setState(() {});
                  await widget.model.getUserSelectedYearLangChoice(
                    choice: studyLangTxt,
                    isItForYear: false,
                  );
                },
                child: AppTextField(
                  enabled: false,
                  controller: widget.model.studyLangCont,
                  textInputType: TextInputType.name,
                  focusNode: focus[6],
                  validateFunction: context.validateFieldNotEmpty,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: focus[6].hasFocus ? appYellowText : appGray,
                  ),
                  hintText: PSStrings.psStudyLanguageHint,
                ),
              ),
              fieldSeparator,
            ],
          ),
        ),
      ),
    );
  }
}
