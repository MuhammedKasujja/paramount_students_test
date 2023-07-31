import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/app_utils/widgets/loaders.dart';
import 'package:paramount_students/ui/auth/registration/view/forms/checklist.dart';
import 'package:paramount_students/ui/auth/registration/view/forms/contact_form.dart';
import 'package:paramount_students/ui/auth/registration/view/forms/document_form.dart';
import 'package:paramount_students/ui/auth/registration/view/forms/education_form.dart';
import 'package:paramount_students/ui/auth/registration/view/forms/profile_form.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/ui/auth/registration/widgets/confirm_dialog.dart';
import 'package:paramount_students/ui/auth/registration/widgets/widgets.dart';
import 'package:paramount_students/ui/base/base_view.dart';

const tabLength = 5;

final regModel = RegisterationViewModel();

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late Timer eventTimer;

  List<Future> futureEvents = [
    regModel.getGradListEvent(),
    regModel.getStudyListEvent(),
    // regModel.getHighSchoolListEvent(),
  ];

  void executeRegFutureEvents() {
    eventTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      Future.wait(futureEvents);
    });
  }

  @override
  void initState() {
    super.initState();
    executeRegFutureEvents();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    eventTimer.cancel();
    super.dispose();
  }

  final int firstPage = 0;
  final int lastPage = tabLength;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterationViewModel>(
      model: RegisterationViewModel(),
      onModelReady: (model) => model.init(),
      onDispose: (model) => model.dispose(),
      builder: (context, model, child) {
        return Theme(
          data: ThemeData().copyWith(
            dividerColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            persistentFooterButtons: [
              OverflowBox(
                maxWidth: MediaQuery.of(context!).size.width,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width,
                  color: HexColor("#EFF1F1"),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: _tabController.index != firstPage,
                          child: MaterialButton(
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width * 0.40,
                            onPressed: () async {
                              if (_tabController.index < lastPage) {
                                if (_tabController.index == 0) {
                                  Navigator.pop(context);
                                  debugPrint('first page here');
                                } else {
                                  _tabController
                                      .animateTo(_tabController.index - 1);
                                }
                              }
                            },
                            elevation: 0,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.amber)),
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 10.0),
                                  child: Text(PSStrings.psBack),
                                ),
                              ],
                            ),
                          )),
                      MaterialButton(
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        onPressed: () async {
                          if (_tabController.index == 0) {
                            if (model!.profileRequest) {
                              toastMessage(
                                'You have clicked this profile form button before pls proceed to the next form swiping right',
                                long: true,
                              );
                            } else {
                              bool isSuccess =
                                  await model.createProfile(context);

                              if (isSuccess) {
                                if (_tabController.index < lastPage - 1) {
                                  _tabController
                                      .animateTo(_tabController.index + 1);
                                }
                              }
                            }
                          } else {
                            if (_tabController.index < lastPage - 1) {
                              _tabController
                                  .animateTo(_tabController.index + 1);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => ConfirmDialog(
                                        model: model!,
                                      ));
                            }
                          }
                        },
                        elevation: 0,
                        color: Colors.amber,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(PSStrings.psNext),
                      )
                    ],
                  ),
                ),
              ),
            ],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              foregroundColor: Colors.black87,
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.close),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Center(child: Text(PSStrings.psCancel)),
                        ),
                      ],
                    ))
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverPersistentHeader(
                      delegate: SliverAppBarDelegate(
                    child: PreferredSize(
                      preferredSize: const Size.fromHeight(100.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          PSStrings.psRegisterTitle,
                          style: PSTextStyle.registerTitleStyle,
                          textWidthBasis: TextWidthBasis.parent,
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  )),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        child: PreferredSize(
                          preferredSize: const Size.fromHeight(38.0),
                          child: Container(
                            color: Colors.white,
                            child: TabBar(
                              controller: _tabController,
                              unselectedLabelStyle:
                                  PSTextStyle.registerUnselectedTabStyle,
                              labelStyle: PSTextStyle.registerSelectedTabStyle,
                              labelPadding: const EdgeInsets.all(10),
                              indicatorColor: Colors.amber,
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              labelColor: Colors.black,
                              tabs: [
                                Text(PSStrings.psProfile),
                                Text(PSStrings.psContacts),
                                Text(PSStrings.psEducation),
                                Text(PSStrings.psDocuments),
                                Text(PSStrings.psChecklist),
                              ],
                            ),
                          ),
                        ),
                      )),
                ];
              },
              body: TabBarView(controller: _tabController, children: [
                model!.isLoading
                    ? appLoader
                    : ProfileForm(registerationViewModel: model),
                ContactForm(model: model),
                EducationForm(model: model),
                DocumentForm(model: model),
                Checklist(model: model),
              ]),
            ),
          ),
        );
      },
    );
  }
}
