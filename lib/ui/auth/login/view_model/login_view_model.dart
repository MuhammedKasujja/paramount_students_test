import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/ui/notification/model/notificaton_model.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/auth/auth_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/requests/auth/signin_model.dart';
import 'package:paramount_students/data/requests/auth/verify_otp.dart';
import 'package:paramount_students/data/response/signin_response/signin_response.dart';
import 'package:paramount_students/data/response/user_model/user.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/data/repository/services/PusherWebSockets/pusher.dart';

class LoginViewModel extends BaseViewModel {
  final auth = AuthRepository();
  final PusherService pusherService = PusherService();

  /// Manage current Keyboard Focus.
  FocusNode focusNode = FocusNode();
  late Widget emailCancelIcon;

  /// Simple management of log in state;
  int emailLogin = 0;
  int mobileLogin = 1;
  late int selectedLogin;

  /// Color
  Color selectedColor = psColorPrimary1000;
  Color unavailableColor = psGrey6;
  Color submitButtonColor = psGrey6;
  late Color registerButtonColor;

  /// Button state management
  bool submitButtonEnabled = false;
  PageController pageController = PageController();

  /// Text Entries Management
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisible = true;
  bool validate = false;
  bool isLogin = false;
  bool isLoading = false;
  int? userId;
  bool verifyOTPLoading = false;

  bool get isVisble => _isVisible;
  set validated(bool val) => validate = val;
  // bool  validatedColor = validate;

  ///verifyOTP
  int? uniqueID = 0;
  int? verifyotp = 0;

  ///User data
  User userData = const User();

  void checkValidatedcolor() {
    if (validate) {
      submitButtonColor = psColorPrimary1000;
      notifyListeners();
    } else {
      submitButtonColor = unavailableColor;
      notifyListeners();
    }
  }

  void togglevisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  @override
  void init() {
    selectedLogin = emailLogin;
    submitButtonColor = unavailableColor;
    registerButtonColor = psColorPrimary1000;
    emailCancelIcon = const SizedBox.shrink();
  }

  @override
  void close() {
    // TODO: implement close
  }

  void goToMobileLogin() {
    if (selectedLogin != emailLogin) {
      selectedLogin = emailLogin;
      pageController.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
    notifyListeners();
  }

  void goToEmailLogin() {
    if (selectedLogin != mobileLogin) {
      selectedLogin = mobileLogin;
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
    notifyListeners();
  }

  verifyText() {
    if (emailController.text.isNotEmpty) {
      // Set Icon to clear and add function
      emailCancelIcon = GestureDetector(
        child: const Icon(
          Icons.cancel,
          color: Colors.grey,
        ),
        onTap: () {
          emailController.text = '';
        },
      );
    }
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      submitButtonEnabled = true;
      submitButtonColor = appYellowText;
      registerButtonColor = unavailableColor;
    }
    notifyListeners();
  }

  Future<bool> login() async {
    try {
      // mikal@gmail.com
      isLoading = true;
      notifyListeners();
      log('attemping to sign in');
      SignInModel signInModel = SignInModel(
        password: passwordController.text,
        email: emailController.text == '' ? 'email' : emailController.text,
        phone: mobileController.text == '' ? 'phone' : mobileController.text,
      );

      final sign = await auth.signIn(signInModel);

      if (sign.isLeft) {
        toastMessage(sign.left.message!['message'], long: false);
        return isLogin;
      } else {
        isLogin = true;
        final result = SigninResponse.fromSigninResponse(sign.right);
        log('''
Name: ${result.userdata!.fullName} 
id: ${result.userdata!.id}
''');
        uniqueID = result.userdata!.uniqueId;
        verifyotp = result.userdata!.otp;
        userId = result.userdata!.id;

        return isLogin;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log('Error from $e');
    } finally {
      notifyListeners();
      isLoading = false;
    }
    notifyListeners();
    return isLogin;
  }

  static int userVerId = 0;

  Future<bool> verifyOTP({required int otp, required Store channelStore, required BuildContext context}) async {
      verifyOTPLoading = true;
      notifyListeners();
    try {
      final localDB = UserRepositoryImpl(
        HiveStorage(Hive.box(HiveKeys.appBox)),
      );

      final verifyData = VerifyOtp(
        otp: otp,
        uniqueId: uniqueID,
      );
      final verify = await auth.verifyOTP(verifyData);

      if (verify.isRight) {
        debugPrint('Data gotten is ${verify.right.user}');

        userData = verify.right.user ?? const User();

        localDB.saveUser(verify.right.user ?? const User());

        localDB.saveToken(verify.right.authorisation!.token ?? '');
        userVerId = verify.right.user!.id ?? 0;

        ///getting pusher instance
        final pusher = pusherService.initPusher(verify.right.authorisation!.token!);
        channelStore.savePusherInstance(pusher);

        pusher.subscribe('notification').bind('notification', (event) {
          final notif = NotificationModel(
              nHeadline: 'Message From ${event['title']}',
              nBody: Html(data: event['description'], style: {
                '*': Style(
                    margin: Margins.only(left: 0),
                    fontSize: FontSize.small,
                    maxLines: null)
              }),
              nTimeage: DateFormat('dd MMMM, yyyy')
                  .parse(event['created_at'] as String),
              id: event['id'],
              ownerType: event['owner_type'][0],
              viewed: event['student_viewed'],
              isRead: event['student_viewed'] == "1");

          channelStore.saveNotifsData(notif);

        }); 

        /// Subscribe to Channels
        pusher.subscribe('presence-go-online.user-$userVerId');
        pusher.subscribe('presence-go-online.highSchoolEmployee');
        pusher.subscribe('presence-go-online.universityEmployee');

               
        notifyListeners();

        toastMessage(verify.right.message ?? 'Welcome');
        return true;
      } else {
        toastMessage(verify.left.message!['message']);
        return false;
      }
    } catch (ex) {
      debugPrint('Error in model OTP: $ex');
      verifyOTPLoading = false;
      notifyListeners();
      return false;
    } finally {
      verifyOTPLoading = false;
    }
  }
}
