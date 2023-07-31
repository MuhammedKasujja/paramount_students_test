import 'dart:developer';
import 'dart:typed_data';
import 'package:either_dart/either.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        TextEditingController,
        Theme,
        ThemeData,
        debugPrint,
        showDatePicker;
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/repository/auth/auth_repo.dart';
import 'package:paramount_students/data/requests/add_high_school.dart';
import 'package:paramount_students/data/requests/auth/contact_form_model.dart';
import 'package:paramount_students/data/requests/auth/country_model_class/country_model_class.dart';
import 'package:paramount_students/data/requests/auth/create_profile.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/auth/education_form_model.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/models/high_school_model/high_school_model.dart';
import 'package:paramount_students/models/state_model_class/state_model_class.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';

class RegisterationViewModel extends BaseViewModel {
  final AuthRepository auth = AuthRepository();

  @override
  void close() {
    // TODO: implement close
    //disposing controllers to prevent  memory leaks
    fullNameController.dispose();
    motherNameController.dispose();
    fatherNameController.dispose();
    dobController.dispose();
    genderController.dispose();
    emailController.dispose();
    highSchCountryCont.dispose();
    hightSchCityCont.dispose();
    highSchCont.dispose();
    yearOfGradCont.dispose();
    majorsCont.dispose();
    stuIDNoCont.dispose();
    studyLangCont.dispose();
    mobileCont.dispose();
    citizenCont.dispose();
    countryOfResidCont.dispose();
    cityProvRegCont.dispose();
    homeaddCont.dispose();
    postalCodeCont.dispose();
    passportCont.dispose();
    issueDateCont.dispose();
    expiryDateCont.dispose();
    countryLocalIdCont.dispose();
  }

  @override
  void init() {
    // TODO: implement init
    getHighSchoolListEvent();
    fetchedCountries();
  }

  List<String> gradYearList = [];
  List<String> studyLangList = [];

  List<HighSchoolModel> highSchoolList = [];
  List<CountryModelClass> countryList = [];
  List<StateModelClass> stateList = [];
  List<String> countryStates = [];
  List<String> statesBuffer = [];
  List<String> highSchStates = [];

  int highSchoolId = 0;

  int countryId = 1;

  bool isLoading = false;
  bool doNotHavePassport = false;

  int? userId;
  bool profileRequest = false;
  bool sendAllFormquest = false;

  ///
  String? gender = '';

  //Document upload

  FilePickerResult? fileUpload0;
  FilePickerResult? fileUpload1;
  FilePickerResult? fileUpload2;
  FilePickerResult? fileUpload3;
  FilePickerResult? fileUpload4;

  Future<void> deleteUploadedDocument({required int fileIndex}) async {
    switch (fileIndex) {
      case 0:
        fileUpload0 = null;
        break;
      case 1:
        fileUpload1 = null;
        break;
      case 2:
        fileUpload2 = null;
        break;
      case 3:
        fileUpload3 = null;
        break;
      case 4:
        fileUpload4 = null;
        break;
      default:
    }
  }

  List<FilePickerResult?> results = [];

  String? fileName;
  List<String?> fileNames = [
    '',
    '',
    '',
    '',
    '',
  ];

  int? fileSize;
  List<int?> fileSizes = [
    0,
    0,
    0,
    0,
    0,
  ];

  Uint8List? fileByte;
  List<Uint8List?> fileBytes = [
    Uint8List(1),
    Uint8List(2),
    Uint8List(3),
    Uint8List(4),
    Uint8List(5),
  ];

  Future<void> pickFile0() async {
    fileUpload0 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload0 != null) {
      fileNames[0] = fileUpload0!.files.first.name;
      fileBytes[0] = fileUpload0!.files.first.bytes;
      fileSizes[0] = fileUpload0!.files.first.size;
      log('File name is $fileNames');
    }
    notifyListeners();
  }

  Future<void> pickFile1() async {
    fileUpload1 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );

    if (fileUpload1 != null) {
      fileNames[1] = fileUpload1!.files.first.name;
      fileBytes[1] = fileUpload1!.files.first.bytes;
      fileSizes[1] = fileUpload1!.files.first.size;

      log('File name is $fileNames');
    }
    notifyListeners();
  }

  Future<void> pickFile2() async {
    fileUpload2 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload2 != null) {
      fileNames[2] = fileUpload2!.files.first.name;
      fileBytes[2] = fileUpload2!.files.first.bytes;
      fileSizes[2] = fileUpload2!.files.first.size;

      log('File name is $fileNames');
    }
    notifyListeners();
  }

  Future<void> pickFile3() async {
    fileUpload3 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload3 != null) {
      fileNames[3] = fileUpload3!.files.first.name;
      fileBytes[3] = fileUpload3!.files.first.bytes;
      fileSizes[3] = fileUpload3!.files.first.size;

      log('File name is $fileNames');
    }
    notifyListeners();
  }

  Future<void> pickFile4() async {
    fileUpload4 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload4 != null) {
      fileNames[4] = fileUpload4!.files.first.name;
      fileBytes[4] = fileUpload4!.files.first.bytes;
      fileSizes[4] = fileUpload4!.files.first.size;

      log('File name is $fileNames');
    }
    notifyListeners();
  }

//TODO: Remove controllers that can be replaced by drop down buttons
  // controllers -profile
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // controllers - education
  TextEditingController highSchCountryCont = TextEditingController();
  TextEditingController hightSchCityCont = TextEditingController();
  TextEditingController highSchCont = TextEditingController();
  TextEditingController yearOfGradCont = TextEditingController();
  TextEditingController stuIDNoCont = TextEditingController();
  TextEditingController majorsCont = TextEditingController();
  TextEditingController studyLangCont = TextEditingController();

  ///add highsch
  TextEditingController addHighcityController = TextEditingController();
  TextEditingController addHighNameController = TextEditingController();

  // controllers - contact
  TextEditingController mobileCont = TextEditingController();
  TextEditingController citizenCont = TextEditingController();
  TextEditingController countryOfResidCont = TextEditingController();
  TextEditingController cityProvRegCont = TextEditingController();
  TextEditingController homeaddCont = TextEditingController();
  TextEditingController postalCodeCont = TextEditingController();
  TextEditingController passportCont = TextEditingController();
  TextEditingController issueDateCont = TextEditingController();
  TextEditingController expiryDateCont = TextEditingController();
  TextEditingController countryLocalIdCont = TextEditingController();

  Future<bool> createProfile(context) async {
    CreateProfile createProfile = CreateProfile(
      action: 'profile',
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      fatherName: fatherNameController.text,
      motherName: motherNameController.text,
      dob: dobController.text,
      email: emailController.text,
      gender: genderController.text,
    );
    try {
      isLoading = true;
      notifyListeners();
      log('attemping to create form');
      final createAccount = await auth.createAccount(createProfile);
      if (createAccount.isRight) {
        final result = createAccount.right;
        userId = result.data!.userId ?? 0;
        toastMessage(result.message ?? 'Not Successful');
        log('Isright');
        profileRequest = true;
        notifyListeners();
        return true;
      } else {
        handleError(createAccount.left.message!['message']);

        profileRequest = false;
        return false;
      }
    } catch (e) {
      isLoading = false;
      log('Error from $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return profileRequest;
  }

  Future<bool> sendAllFormRequest(context) async {
    isLoading = true;
    notifyListeners();
    log('Attemping to send all form request');
    final ContactFormModel contactFormModel = ContactFormModel(
      action: "contact",
      userId: userId,
      phone: mobileCont.text,
      citizen: citizenCont.text,
      countryResidence: countryOfResidCont.text,
      cityRegion: cityProvRegCont.text,
      homeAddress: homeaddCont.text,
      passport: doNotHavePassport ? 'no passport' : passportCont.text,
      issueDate: doNotHavePassport ? 'no passport' : issueDateCont.text,
      expiryDate: doNotHavePassport ? 'no passport' : expiryDateCont.text,
      countryLocalId: countryLocalIdCont.text,
    );
    log('Field Input: ${contactFormModel.toString()}');
    final EducationFormModel educationForm = EducationFormModel(
        action: "education",
        userId: userId,
        highSchoolCountry: highSchCountryCont.text,
        highSchoolCity: hightSchCityCont.text,
        highSchool: highSchCont.text.isEmpty
            ? addHighNameController.text
            : highSchCont.text,
        highSchoolGraduationYear: yearOfGradCont.text,
        studentIdNumber: stuIDNoCont.text,
        highSchoolMajors: majorsCont.text,
        studyLanguage: studyLangCont.text,
        highSchoolId: highSchoolId);

    log('Field Input ${educationForm.toString()}');

    final DocumentUploadFormModel documentUploadFormModel =
        DocumentUploadFormModel(
      action: "document_upload",
      userId: userId,
      highschoolMarksheet: fileUpload0!.files.first,
      highschoolCertificate: fileUpload1!.files.first,
      formalPhoto: fileUpload2!.files.first,
      localIdCard: fileUpload3!.files.first,
      passportFront: fileUpload4!.files.first,
    );

    final contactFormRequest = await auth.createContactForm(contactFormModel);

    if (contactFormRequest.isLeft) {
      log('contact form error ${contactFormRequest.left.message}');
      handleError(contactFormRequest.left.message!['message']);
      return sendAllFormquest;
    } else {
      log('contact form success');
      toastMessage('Contact form ${contactFormRequest.right.message}');

      final educationFormRequest =
          await auth.createEducationForm(educationForm);

      if (educationFormRequest.isLeft) {
        log('education form error');
        log('ERROR: ${educationFormRequest.left.message}');
        handleError(educationFormRequest.left.message!['message']);
        sendAllFormquest = false;
        return sendAllFormquest;
      } else {
        log('education form success');
        toastMessage('Education form ${educationFormRequest.right.message}');

        if (fileUpload0 == null) {
          toastMessage('Please make the right selection');
        } else {
          final documentFormRequest =
              await auth.createDocumentForm(documentUploadFormModel);
          if (documentFormRequest.isLeft) {
            log('document failed ${documentFormRequest.left.message!}');

            handleError(documentFormRequest.left.message!['message']);
            return sendAllFormquest;
          } else {
            log('document sucses');
            toastMessage('Document Form ${documentFormRequest.right.message}');
            sendAllFormquest = true;
            notifyListeners();

            return sendAllFormquest;
          }
        }
      }
      isLoading = false;
      notifyListeners();
      return sendAllFormquest;
    }
  }

  void handleSucces(String data) {
    toastMessage(
      data,
      long: true,
    );
  }

  void handleError(dynamic data) {
    log('handleErrorData: ${data}');
    if (data is Map<String, dynamic>) {
      late String errorMessage;
      for (var key in data.values) {
        log('MessageKey: ${key}');
        errorMessage = key.toString();
      }
      toastMessage(
        errorMessage,
        long: true,
      );
    } else if (data is String) {
      toastMessage(
        data,
        long: true,
      );
    } else if (data is List) {
      for (var error in data) {
        toastMessage(
          error,
          long: true,
        );
      }
    } else {
      toastMessage(
        data.toString(),
        long: true,
      );
    }
  }

  Future<String> openDatePicker(
      {required BuildContext context,
      required bool isItForBOD,
      required bool isItForPassportIssueDate}) async {
    var today = DateTime.now();
    var formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime.utc(1900),
        lastDate: today.add(
          const Duration(days: 30 * 3),
        ),
        builder: (BuildContext context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: psColorPrimary1000,
              ),
            ),
            child: child!,
          );
        });

    if (pickedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      if (isItForBOD == true) {
        dobController.text = formattedDate;
      } else {
        if (isItForPassportIssueDate == true) {
          issueDateCont.text = formattedDate;
        } else {
          expiryDateCont.text = formattedDate;
        }
      }
    }

    return formattedDate;
  }

  Future<void> getUserSelectedCountry({
    required String countryChoice,
    required bool isItForContact,
  }) async {
    countryId = getCountryId(
        countryListData: countryList, selectedChoice: countryChoice);
    if (isItForContact == true) {
      countryOfResidCont.text = countryChoice;
      await fetchedState(list: countryStates);
    } else {
      highSchCountryCont.text = countryChoice;
      await fetchedState(list: highSchStates);
    }
    notifyListeners();
  }

  Future<void> getUserSelectedYearLangChoice({
    required String choice,
    required bool isItForYear,
  }) async {
    if (isItForYear == true) {
      yearOfGradCont.text = choice;
    } else {
      studyLangCont.text = choice;
    }
  }

  Future<void> getUserSelectedHighSchoolChoice({
    required HighSchoolModel highSchoolChoice,
  }) async {
    if (highSchoolChoice.id != null) {
      highSchCont.text = highSchoolChoice.name!;
      highSchoolId = highSchoolChoice.id!;
    }
  }

  Future getGradListEvent() async {
    Either<Failure, Map<String, dynamic>> data =
        await auth.getGraduationYearList();
    if (data.isRight) {
      gradYearList = data.right[''];
    } else {
      if (gradYearList.isEmpty) {
        gradYearList = [];
      }
    }
  }

  Future getStudyListEvent() async {
    Either<Failure, Map<String, dynamic>> data =
        await auth.getStudyLanguageList();
    if (data.isRight) {
      studyLangList = data.right[''];
    } else {
      if (studyLangList.isEmpty) {
        studyLangList = [];
      }
    }
  }

  Future getHighSchoolListEvent() async {
    Either<Failure, List<HighSchoolModel>> data =
        await auth.getHighSchoolList();
    if (data.isRight) {
      highSchoolList = data.right;
    } else {
      if (highSchoolList.isEmpty) {
        highSchoolList = [];
      }
    }
  }

  Future fetchedCountries() async {
    Either<Failure, List<CountryModelClass>> data = await auth.countryList();
    if (data.isRight) {
      countryList = data.right;
    } else {
      debugPrint('error in fetching country');
    }
  }

  Future fetchedState({required List<String> list}) async {
    log('fetching states');
    Either<Failure, List<StateModelClass>> data =
        await auth.stateList(countryId: countryId);
    if (data.isRight) {
      debugPrint('List from state ${data.right}');
      stateList = data.right;
      //checking if list is full from previous call
      if (list.isNotEmpty) {
        list.clear();
      }
      for (int x = 0; x < stateList.length; x++) {
        list.add(stateList[x].name!);
      }
      statesBuffer.replaceRange(0, statesBuffer.length, list);
      notifyListeners();
    } else {
      debugPrint('error in fetching country');
    }
  }

  int getStateId(
      {required String stateSelected,
      required List<StateModelClass> statList}) {
    int stateId = 0;
    for (var state in statList) {
      if (state.name == stateSelected) {
        stateId = state.id ?? 0;
      }
    }

    return stateId;
  }

  int getCountryId(
      {required List<CountryModelClass> countryListData,
      required String selectedChoice}) {
    int countryId = 1;

    for (var selectedCountry in countryListData) {
      if (selectedCountry.name!.toLowerCase() == selectedChoice.toLowerCase()) {
        log('Selected choice country data $selectedCountry and id is ${selectedCountry.id}');
        countryId = selectedCountry.id ?? 1;
        return countryId;
      } else {
        debugPrint('it does not match');
      }
    }
    log('The countryId return : $countryId');
    return countryId;
  }

  Future<void> getDropdownUserChoice({
    required String userChoice,
    TextEditingController? controller,
  }) async {
    controller!.text = userChoice;
    notifyListeners();
    debugPrint(
        'the value is $userChoice ${genderController.text} - ${citizenCont.text} - ${countryOfResidCont.text}');
  }

  Future<bool> addHighSch(AddHighSchool addHighSchool) async {
    try {
      final verify = await auth.addHighSch(addHighSchool);

      if (verify.isRight) {
        debugPrint('Data gotten is ${verify.right.toString()}');
        return true;
      } else {
        toastMessage(verify.left.message!['message']);
        return false;
      }
    } catch (ex) {
      debugPrint('Error in model OTP: $ex');
      return false;
    }
  }

  String getMessage(dynamic responseMessage) {
    List<String> message = [];

    if (responseMessage is Map) {
      (responseMessage as Map).values.forEach((value) {
        message.add(value.toString());
      });
    } else {
      message.add(responseMessage.toString());
    }

    return message.join(',\n');
  }
}
