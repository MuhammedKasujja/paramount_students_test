import 'dart:developer';
import 'dart:typed_data';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart'
    show BuildContext, NavigatorState, TextEditingController;
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/auth/auth_repo.dart';
import 'package:paramount_students/data/repository/programs/programs_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/requests/auth/contact_form_model.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/programs/program_application_model.dart';
import 'package:paramount_students/data/response/programs/program_app_res.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/file_operation.dart';
import 'package:paramount_students/ui/course_program/widget/application_review_strings.dart';

import '../../auth/login/view_model/login_view_model.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class ProgramViewModel extends BaseViewModel {
  final loginModel = LoginViewModel();
  final AuthRepository auth = AuthRepository();
  final ApplicationReviewStrings apStrings = ApplicationReviewStrings();
  Either<ProgramAppRes, ProgramAppRes>? additionalDocRequest;

  @override
  void close() {
    // TODO: implement close
    mobileCont.dispose();
    citizenCont.dispose();
    countryOfResidCont.dispose();
    cityProvRegCont.dispose();
    homeaddCont.dispose();
    postalCodeCont.dispose();
    issueDateCont.dispose();
    expiryDateCont.dispose();
    countryLocalIdCont.dispose();
    passportCont.dispose();
    fileNameCont.dispose();
  }

  @override
  void init() {
    // TODO: implement init
  }

  bool isSuccess = false;
  bool isLoading = false;
  Map<String, dynamic> documentMap = {};
  bool studentDataUpdated = false;
  bool doNotHavePassport = false;
  //Document upload
  FilePickerResult? fileUpload0;

  String? fileName;

  Uint8List? fileByte;

  double? fileSize;

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
  TextEditingController fileNameCont = TextEditingController();

  void deleteUploadedDocument() {
    fileUpload0 = null;
    //clearing selected file from box
    localDB.deleteEntry(HiveKeys.file0);
    localDB.deleteEntry(HiveKeys.file1);
    localDB.deleteEntry(HiveKeys.file2);
    localDB.deleteEntry(HiveKeys.file3);
    notifyListeners();
  }


  Future<bool> programApplication(
      {Map<String, dynamic>? documents, required int programId}) async {
    log('program view model userID = ${LoginViewModel.userVerId}');
    log('program view model userId = ${loginModel.userId}');

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final ProgramsRepo programsRepo = ProgramsRepo(token);
    final ProgramApplicationModel data = ProgramApplicationModel(
      programId: programId,
      userId: loginModel.userId ?? LoginViewModel.userVerId,
      documents: documents ?? {},
    );
    log('program application');
    try {
      isLoading = true;
      notifyListeners();

      log('Sending a program request');

      final apply = await programsRepo.programApplication(data);

      if (apply.isRight) {
        log('Right respon: ${apply.right}');
        isSuccess = true;
        toastMessage(apply.right.responseBody!);
      } else {
        log('Request was left: ${apply.left.responseBody}');
        handleError(apply.left.responseBody);
      }
    } catch (ex, trace) {
      log('Exception caught : $ex, with strace: $trace');
      toastMessage(ex.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return isSuccess;
  }

  Future<void> pickFile0(BuildContext context, String val, NavigatorState navigator, 
  {TextEditingController? controller, bool isAddingExtra = false, Store? store}) async {
    final userFileName = await showUpdateDialog(context, val, navigator, controller: controller, mandatory: true);
    //clearing textfield text
    controller!.clear();

    fileUpload0 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload0 != null) {
      fileName = fileUpload0!.files.first.name;
      fileByte = fileUpload0!.files.first.bytes;
      fileSize = (fileUpload0!.files.first.size/1024)/1024;
      if(fileSize! > 5.0){
        log('file has exceeded file size limit');
        toastMessage("File has exceeded 5MB", long: true);
        return;
      }
      log('File name is $fileName');
      log('File size is $fileSize');
      //checking if user wants to add more than one document
      if (isAddingExtra == true) {
        final FileOperation fileOperation = FileOperation(
            fileUpload0: fileUpload0,
            userFileName: userFileName,
            handleError: handleError,);
          
          fileOperation.savingFiles();
          log('hive storage length: ${localDB.boxLength()}');
      }
      //checking if user wants to replace documents
      if(localDB.boxLength() >= 3 && isAddingExtra == false){
        final currentIndex = localDB.boxLength() - 3;
        localDB.deleteEntry('file$currentIndex');
        localDB.saveFile(PickedFile(
          filePath0: fileUpload0!.files.first.path!, 
          userFileName0: userFileName!,
          fileName0: fileUpload0!.files.first.name), currentIndex);
      }
      if(localDB.boxLength() < 3){
        localDB.saveFile(PickedFile(
          filePath0: fileUpload0!.files.first.path!, 
          fileName0: fileUpload0!.files.first.name, 
          userFileName0: userFileName!), 0);
      }
    }
    notifyListeners();
  }

  void getUserChoice(String userChoice, TextEditingController controller) {
    controller.text = userChoice;
    notifyListeners();
  }

  Future<Either<bool, Map<String, dynamic>>> sendUpdatedStudentRequest(Map<String, dynamic> textFieldValues, {Store? store}) async {
    log('box-length: ${localDB.boxLength()}');

    if (textFieldValues.isNotEmpty) {
      studentDataUpdated = true;
    } else {
      studentDataUpdated = false;
    }

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final ProgramsRepo programsRepo = ProgramsRepo(token);

    try {
      isLoading = true;
      notifyListeners();

      if (studentDataUpdated == false) {
        if (localDB.boxLength() < 3) {
          log('didn\'t add extra document, or update student data');
          isSuccess = true;
          notifyListeners();
        }

        if (localDB.boxLength() >= 3) {
          log('Attempting to send extra document, without any updated student data');

          final FileOperation fileOperation = FileOperation(
            programsRepo: programsRepo, 
            store: store,
            deleteUploadedDocument: deleteUploadedDocument, 
            handleError: handleError, );
          
           final result = await fileOperation.sortingFilesForRequest();

          if (localDB.boxLength() == 3) {
            documentMap = {...result[0]};
          }else if(localDB.boxLength() == 4){
            documentMap = {...result[0], ...result[1]};
          }else{
            documentMap = {...result[0], ...result[1], ...result[2]};
          }

          notifyListeners();
           //clearing selected file from hive storage
          deleteUploadedDocument();
          toastMessage('Extra Document Added', long: true);            

        }
      }

      if (studentDataUpdated == true) {
        final ContactFormModel contactFormModel = ContactFormModel(
          action: "contact",
          phone: apStrings.phone,
          userId: localDB.getUser().id ?? 0,
          citizen: apStrings.citizen,
          countryResidence:
              textFieldValues['country_name'] ?? apStrings.countryRes,
          cityRegion: textFieldValues['city'] ?? apStrings.cityReg,
          homeAddress: textFieldValues['address'] ?? apStrings.homeAdd,
          passport: textFieldValues["pass_id"] ?? apStrings.passportId,
          issueDate: textFieldValues["issue_date"] ?? apStrings.issueDate,
          expiryDate: textFieldValues["expiry_date"] ?? apStrings.expiryDate,
          countryLocalId: apStrings.countryLocalId,
        );

        if (localDB.boxLength() < 3) {
          log('attempting to send updated student data, without adding extra document');

          final contactFormRequest =
              await auth.createContactForm(contactFormModel);

          if (contactFormRequest.isLeft) {
            log('updating student data failed: ${contactFormRequest.left.message}');

            handleError(contactFormRequest.left.message!['message']);
          } else {
            log('updating student data successful');
            toastMessage('student data updated', long: true);
            isSuccess = true;
            notifyListeners();
          }
        }

        if (localDB.boxLength() >= 3) {
          log('attempting to send updated student data, with extra document');
          final contactFormRequest =
              await auth.createContactForm(contactFormModel);

          if (contactFormRequest.isLeft) {
            log('updating student data failed ${contactFormRequest.left.message}');

            handleError(contactFormRequest.left.message!['message']);
          } else {
            log('updating student data successful');
            final FileOperation fileOperation = FileOperation(
            programsRepo: programsRepo, 
            store: store,
            deleteUploadedDocument: deleteUploadedDocument, 
            handleError: handleError, 
            withStudentData: true);
          
            final result = await fileOperation.sortingFilesForRequest();

            if (localDB.boxLength() == 3) {
              documentMap = {...result[0]};
            }else if(localDB.boxLength() == 4){
              documentMap = {...result[0], ...result[1]};
            }else{
              documentMap = {...result[0], ...result[1], ...result[2]};
            }          
            notifyListeners();
            //clearing selected file from hive storage
            deleteUploadedDocument();
            toastMessage('student data updated', long: true);            
            
          }
        }
      }
    } catch (ex, trace) {
      log('Exception caught : $ex, with strace: $trace');
      toastMessage(ex.toString(), long: true);
    } finally {
      isLoading = false;
      notifyListeners();
    }

    if (documentMap.isEmpty) {
      return Left(isSuccess);
    } else {
      return Right(documentMap);
    }
  }

  void handleError(dynamic data) {
    if (data is Map<String, dynamic>) {
      toastMessage(
        data['message'],
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
}
