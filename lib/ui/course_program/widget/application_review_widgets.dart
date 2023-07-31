import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/app_textfield.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/auth/verify_page.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';
import 'package:paramount_students/ui/auth/country_list.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/ui/auth/picked_document_widget.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/course_program/widget/application_review_strings.dart';

import '../view_model/program_view_model.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class ApplicationReviewWidgets extends StatefulWidget {
  const ApplicationReviewWidgets({
    super.key,
    required this.programId,
    required this.setUpdatedValues,
    this.store,
    required this.textFieldValues,
    required this.model,
  });
  final int programId;
  final Store? store;
  final Function setUpdatedValues;
  final Map<String, dynamic> textFieldValues;
  final ProgramViewModel model;

  @override
  State<ApplicationReviewWidgets> createState() =>
      _ApplicationReviewWidgetsState();
}

class _ApplicationReviewWidgetsState extends State<ApplicationReviewWidgets> {
  final RegisterationViewModel regModel = RegisterationViewModel();
  final ApplicationReviewStrings apStrings = ApplicationReviewStrings();
  Country? currentCountry;
  Country? countryBuffer;
  bool enableStatesCityField = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regModel.init();

    widget.model.citizenCont.text = apStrings.citizen;
    widget.model.mobileCont.text = apStrings.phone;
    widget.model.countryOfResidCont.text = apStrings.countryRes;
    widget.model.cityProvRegCont.text = apStrings.cityReg;
    widget.model.homeaddCont.text = apStrings.homeAdd;
    widget.model.postalCodeCont.text = apStrings.postalCode;
    widget.model.passportCont.text = apStrings.passportId;
    widget.model.issueDateCont.text = apStrings.issueDate;
    widget.model.expiryDateCont.text = apStrings.expiryDate;
    widget.model.countryLocalIdCont.text = apStrings.countryLocalId;

    final selectedCountry = Countries.countryList
        .firstWhere((element) => element.name == apStrings.countryRes);
    currentCountry = selectedCountry;
    countryBuffer = selectedCountry;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final navigator = Navigator.of(context);

    List<Widget> formItems = [
      sText(
        'Profile',
        size: 17,
        weight: FontWeight.bold,
        color: appBlackText,
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("Full Name"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        enabled: false,
        textInputType: TextInputType.name,
        hintText: 'Gustavo Henrique Almeda Ferreira',
        initialValue: apStrings.fullName,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Father Name"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        enabled: false,
        textInputType: TextInputType.name,
        initialValue: apStrings.fatherName,
        hintText: 'Almeda Ferreira',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Mother Name"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.name,
        enabled: false,
        hintText: 'Zerreira Timelda',
        initialValue: apStrings.motherName,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Date Of Birth"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        enabled: false,
        textInputType: TextInputType.text,
        initialValue: apStrings.dob,
        hintText: '1996-05-02',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Gender"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        initialValue: apStrings.gender,
        hintText: 'Male',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Email Address"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.emailAddress,
        initialValue: apStrings.email,
        enabled: false,
        hintText: 'test@test.com',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      sText(
        'Education',
        size: 17,
        weight: FontWeight.bold,
        color: appBlackText,
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("High School Country"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        hintText: 'Choose A Country',
        initialValue: apStrings.highSchCountry,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(
            6,
          ),
          margin: const EdgeInsets.only(
            right: 3,
          ),
          child: CircleAvatar(
            radius: 10,
            foregroundImage: AssetImage(apStrings.highSchFlagPath),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("High School"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        hintText: 'Grammar School',
        initialValue: apStrings.highSch,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("(Expected) Graduation"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.number,
        initialValue: apStrings.gradYr,
        enabled: false,
        hintText: '2018',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Study Language"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        initialValue: apStrings.studyLang,
        enabled: false,
        hintText: 'English',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Majors"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        hintText: 'Computer Science',
        initialValue: apStrings.highSchMajors,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Student ID Number"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.number,
        enabled: false,
        initialValue: apStrings.studentId,
        hintText: '12345678',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("City"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        hintText: 'Andarra',
        initialValue: apStrings.highSchCty,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      sText(
        'Contacts',
        size: 17,
        weight: FontWeight.bold,
        color: appBlackText,
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("Mobile"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.number,
        enabled: false,
        hintText: '000 000 0000',
        controller: widget.model.mobileCont,
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 10,
                  foregroundImage: AssetImage(apStrings.citizenFlagPath),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(apStrings.dialCode),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: psBlack1,
                ),
                const SizedBox(
                  width: 4,
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: psBlack1,
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Citizenship"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.text,
        enabled: false,
        controller: widget.model.citizenCont,
        hintText: 'Choose A Country',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(
            6,
          ),
          margin: const EdgeInsets.only(
            right: 3,
          ),
          child: CircleAvatar(
            radius: 10,
            foregroundImage: AssetImage(apStrings.citizenFlagPath),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text("Country Local ID Number"),
      const SizedBox(
        height: 8,
      ),
      AppTextField(
        backgroundColor: psInfoBg,
        textInputType: TextInputType.number,
        enabled: false,
        controller: widget.model.countryLocalIdCont,
        hintText: '90976000000',
        suffixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(mainAxisSize: MainAxisSize.min, children: const [
        Text("Country Of Residence "),
        Text(
          "*",
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ]),
      const SizedBox(
        height: 8,
      ),
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
            ),
          );

          await regModel.getUserSelectedCountry(
            countryChoice: currentCountry!.name,
            isItForContact: true,
          );

          widget.model.getUserChoice(
              currentCountry!.name, widget.model.countryOfResidCont);
          widget.setUpdatedValues({"country_name": currentCountry?.name});
          setState(() {
            countryBuffer = currentCountry;
            enableStatesCityField = true;
          });
        },
        child: AppTextField(
          enabled: false,
          textInputType: TextInputType.text,
          hintText: 'Choose A Country',
          controller: widget.model.countryOfResidCont,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(mainAxisSize: MainAxisSize.min, children: const [
        Text("City, Province, Region "),
        Text(
          "*",
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ]),
      const SizedBox(
        height: 8,
      ),
      GestureDetector(
        onTap: enableStatesCityField
            ? () async {
                final result = await showUpdateDialog(
                  context,
                  'City',
                  navigator,
                  countryStatesList: regModel.countryStates,
                  controller: widget.model.cityProvRegCont,
                  isDropdown: true,
                );
                widget.setUpdatedValues({'city': result});
                setState(() {});
              }
            : null,
        child: AppTextField(
          enabled: false,
          textInputType: TextInputType.text,
          hintText: 'City',
          controller: widget.model.cityProvRegCont,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(mainAxisSize: MainAxisSize.min, children: const [
        Text("Home Address "),
        Text(
          "*",
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ]),
      const SizedBox(
        height: 8,
      ),
      GestureDetector(
        onTap: () async {
          final result = await showUpdateDialog(
              context, "Change Your Address", navigator,
              controller: widget.model.homeaddCont, isDropdown: false);
          widget.setUpdatedValues({'address': result});
          setState(() {});
        },
        child: AppTextField(
          textInputType: TextInputType.multiline,
          controller: widget.model.homeaddCont,
          enabled: false,
          maxLines: 5,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(mainAxisSize: MainAxisSize.min, children: const [
        Text("Postal Code "),
        Text(
          "*",
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ]),
      const SizedBox(
        height: 8,
      ),
      GestureDetector(
        onTap: () async {
          final result = await showUpdateDialog(
              context, "Change Your Postal Code", navigator,
              controller: widget.model.postalCodeCont,
              isNumberOnly: true,
              isDropdown: false);
          widget.setUpdatedValues({"postal_code": result});
        },
        child: AppTextField(
          textInputType: TextInputType.number,
          controller: widget.model.postalCodeCont,
          enabled: false,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Visibility(
        child: Text('Passport'),
        visible: !widget.model.doNotHavePassport,
      ),
      const SizedBox(
        height: 8,
      ),
      Visibility(
        visible: !widget.model.doNotHavePassport,
        child: GestureDetector(
          onTap: () async {
            final result = await showUpdateDialog(
                context, 'Change Passport ID', navigator,
                controller: widget.model.passportCont, isDropdown: false);
            widget.setUpdatedValues({"pass_id": result});
          },
          child: AppTextField(
            textInputType: TextInputType.text,
            enabled: false,
            controller: widget.model.passportCont,
            suffixIcon: const Icon(
              Icons.error_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.model.doNotHavePassport = !widget.model.doNotHavePassport;
            });
            if (widget.model.doNotHavePassport) {
              widget.setUpdatedValues({"pass_id": "no passport"});
              widget.setUpdatedValues({"issue_date": "no passport"});
              widget.setUpdatedValues({"expiry_date": "no passport"});
            } else {
              widget.textFieldValues.remove('pass_id');
              widget.textFieldValues.remove('expiry_date');
              widget.textFieldValues.remove('issue_date');
              widget.setUpdatedValues(widget.textFieldValues);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                widget.model.doNotHavePassport ? psColorPrimary1000 : psWhite),
          ),
          child: Text(
            'I don\'t have my passport yet',
            style: TextStyle(
              decoration: widget.model.doNotHavePassport
                  ? TextDecoration.none
                  : TextDecoration.underline,
              color: appBlackText,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ]),
      const SizedBox(
        height: 16,
      ),
      Visibility(
        visible: !widget.model.doNotHavePassport,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text("Issue Date "),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await regModel.openDatePicker(
                        context: context,
                        isItForBOD: false,
                        isItForPassportIssueDate: true,
                      );
                      widget.model
                          .getUserChoice(result!, widget.model.issueDateCont);
                      widget.setUpdatedValues({"issue_date": result});
                      setState(() {});
                    },
                    child: AppTextField(
                      textInputType: TextInputType.text,
                      hintText: 'YYYY-MM-DD',
                      controller: widget.model.issueDateCont,
                      enabled: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Expiry Date "),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await regModel.openDatePicker(
                          context: context,
                          isItForBOD: false,
                          isItForPassportIssueDate: false);
                      widget.model
                          .getUserChoice(result, widget.model.expiryDateCont);
                      widget.setUpdatedValues({"expiry_date": result});
                    },
                    child: AppTextField(
                      textInputType: TextInputType.text,
                      controller: widget.model.expiryDateCont,
                      hintText: 'YYYY-MM-DD',
                      enabled: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      sText(
        'Documents',
        size: 17,
        weight: FontWeight.bold,
        color: appBlackText,
      ),
      const SizedBox(
        height: 20,
      ),
      const AppTextField(
        textInputType: TextInputType.text,
        backgroundColor: psInfoBg,
        prefixIcon: Icon(
          Icons.file_present_rounded,
          color: appBlackText,
        ),
        enabled: false,
        hintText: 'High Shool MarkSheet.pdf',
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const AppTextField(
        textInputType: TextInputType.text,
        backgroundColor: psInfoBg,
        prefixIcon: Icon(
          Icons.file_present_rounded,
          color: appBlackText,
        ),
        enabled: false,
        hintText: 'High School Certificate.pdf',
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const AppTextField(
        textInputType: TextInputType.text,
        backgroundColor: psInfoBg,
        prefixIcon: Icon(
          Icons.file_present_rounded,
          color: appBlackText,
        ),
        enabled: false,
        hintText: 'Upload Your Formal Photo.jpg',
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const AppTextField(
        backgroundColor: psInfoBg,
        enabled: false,
        hintText: 'Upload Country Local ID Num.jpg',
        prefixIcon: Icon(
          Icons.file_present_rounded,
          color: appBlackText,
        ),
        textInputType: TextInputType.text,
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Divider(
        thickness: 1,
        color: psBlack1,
      ),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        child: Column(
          children: [
            widget.model.fileUpload0 == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      sText(
                        'Add More Documents',
                        size: 14,
                        color: appBlackText,
                      ),
                    ],
                  )
                : PickedDocumentWidget(
                    deleteFileFunctionality: () {
                      widget.model.deleteUploadedDocument();
                    },
                    fileSize: widget.model.fileSize!,
                    filename: widget.model.fileName!,
                  ),
            Visibility(
              visible: widget.model.fileUpload0 != null,
              child: Column(
                children: [
                  const Spacing.smallHeight(),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    onPressed: () async {
                      await widget.model.pickFile0(
                          context, "Provide File Name", navigator,
                          controller: widget.model.fileNameCont);
                    },
                    elevation: 0,
                    textColor: Colors.black,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      //border side
                      side: const BorderSide(
                        color: psSuccess,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload_file_rounded,
                          color: Colors.white,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Text(
                            PSStrings.psReplaceDocument,
                            style: PSTextStyle.replaceButtonStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacing.smallHeight()
                ],
              ),
            ),
          ],
        ),
        onTap: () async {
          await widget.model.pickFile0(context, "Provide File Name", navigator,
              controller: widget.model.fileNameCont, store: widget.store);
          setState(() {});
        },
      ),
      Visibility(
        visible: widget.model.fileUpload0 != null,
        child: Column(
          children: [
            const Spacing.smallHeight(),
            GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    sText(
                      'Add More Documents',
                      size: 14,
                      color: appBlackText,
                    ),
                  ],
                ),
                onTap: () async {
                  if (localDB.boxLength() == 5) {
                    log('maximum no of documents allowed has been reached');
                    toastMessage("You can't add anymore documents", long: true);
                    return;
                  }
                  await widget.model.pickFile0(
                      context, "Provide File Name", navigator,
                      controller: widget.model.fileNameCont,
                      store: widget.store,
                      isAddingExtra: true);
                  setState(() {});
                }),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      sText(
        'You Can Only Upload Files Up to 10MB In Size Each From The Following Types: JPEG, GIF, PNG, and PDF. Please Make Sure Tha The Image Is Not Blurry Or Distorted, And Has Plenty Of Contrast. Remember That They Should Be Legible When Printed Out. The Documents Must Be Upright (Not Upside Down) And In Portrait Mode (Taller Rather Than Wider)',
        size: 13,
        color: appBlackText,
        maxLines: 8,
      ),
      if (!isLandscape)
        const SizedBox(
          height: 80,
        ),
      if (isLandscape)
        const SizedBox(
          height: 50,
        ),
      if (isLandscape)
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () async {
              log('updated values: ${widget.textFieldValues}');
              final result = await widget.model.sendUpdatedStudentRequest(
                  widget.textFieldValues,
                  store: widget.store);

              if (result.isRight) {
                goTo(
                    context,
                    VerifyPage(
                        programId: widget.programId,
                        programDocs: result.right));
              } else {
                if (result.left == true) {
                  goTo(
                      context,
                      VerifyPage(
                        programId: widget.programId,
                      ));
                }
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              fixedSize: const Size(375, 40),
            ),
            child: widget.model.isLoading
                ? const AppLoader(
                    size: 80,
                    color: Colors.white,
                  )
                : const Text("Submit"),
          ),
        ),
      if (isLandscape)
        const SizedBox(
          height: 30,
        ),
    ];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: formItems.length,
        itemBuilder: (_, i) => formItems[i]);
  }
}
