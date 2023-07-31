import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/auth/verify_page.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';
import 'package:paramount_students/ui/course_program/widget/application_review_widgets.dart';
import 'package:provider/provider.dart';
import '../../../data/local_database.dart/local_db.dart';
import '../widget/application_review_screen_bar.dart';
import '../widget/application_review_title_bar.dart';
import '../view_model/program_view_model.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class ApplicationReview extends StatefulWidget {
  const ApplicationReview({super.key, required this.programId});
  final int programId;

  @override
  State<ApplicationReview> createState() => _ApplicationReviewState();
}

class _ApplicationReviewState extends State<ApplicationReview> {
  final _formKey = GlobalKey<FormState>();
  final ProgramViewModel model = ProgramViewModel();
  Map<String, dynamic> textFieldValues = {};


  void setUpdatedValues(Map<String, dynamic> updatedValue){
    for(var key in textFieldValues.keys.toList()){
      if(updatedValue.containsKey(key)){
        textFieldValues.remove(key);
      }
    }
    
    setState(() {
      textFieldValues.addEntries(updatedValue.entries);
    });
    
 }

 @override
  void dispose() {
    super.dispose();
    localDB.deleteEntry(HiveKeys.file0);
    localDB.deleteEntry(HiveKeys.file1);
    localDB.deleteEntry(HiveKeys.file2);
    localDB.deleteEntry(HiveKeys.file3);
    model.close();
  }
  
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final generalStore = Provider.of<Store>(context, listen: false);

    return WillPopScope(
      onWillPop: ()async{
        Provider.of<Store>(context, listen: false).clearFileData();
        return true;
      },
      child: Scaffold(
        body: MediaQuery.of(context).viewInsets.bottom > 0
        ? SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  if(MediaQuery.of(context).viewInsets.bottom == 0 || !isLandscape)
                  const ApplicationReviewBar(),
                  if(MediaQuery.of(context).viewInsets.bottom == 0 || !isLandscape)
                  const ApplicationReviewTitleBar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: Form(
                        key: _formKey,
                        child: ApplicationReviewWidgets(
                          model: model,
                          store: generalStore,
                          programId: widget.programId,
                          setUpdatedValues: setUpdatedValues,
                          textFieldValues: textFieldValues
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              if (!isLandscape)
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(color: psGrey6),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      log('textfield values: $textFieldValues');
                      final result= await model.sendUpdatedStudentRequest(textFieldValues, store: generalStore);
          
                      if (result.isRight) {
                        goTo(
                          context,
                          VerifyPage(
                            programId: widget.programId,
                            programDocs: result.right
                          ));
                      }else{
                        if(result.left == true){
                          goTo(
                            context,
                            VerifyPage(
                              programId: widget.programId,
                            ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: Colors.black,
                      // backgroundColor: Colors.amber,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      fixedSize: const Size(375, 40),
                    ),
                    child: model.isLoading
                        ? const AppLoader(
                            color: Colors.white,
                          )
                        : const Text("Submit"),
                  ),
                ),
            ],
          ),
        )
        : Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  if(MediaQuery.of(context).viewInsets.bottom == 0 || !isLandscape)
                  const ApplicationReviewBar(),
                  if(MediaQuery.of(context).viewInsets.bottom == 0 || !isLandscape)
                  const ApplicationReviewTitleBar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: Form(
                        key: _formKey,
                        child: ApplicationReviewWidgets(
                          model: model!,
                          store: generalStore,
                          programId: widget.programId,
                          setUpdatedValues: setUpdatedValues,
                          textFieldValues: textFieldValues
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              if (!isLandscape)
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(color: psGrey6),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      log('textfield values: $textFieldValues');
                      final result = await model.sendUpdatedStudentRequest(textFieldValues, store: generalStore);
          
                      if (result.isRight) {
                        goTo(
                          context,
                          VerifyPage(
                            programId: widget.programId,
                            programDocs: result.right
                          ));
                      }else{
                        if(result.left == true){
                          goTo(
                            context,
                            VerifyPage(
                              programId: widget.programId,
                            ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: Colors.black,
                      // backgroundColor: Colors.amber,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      fixedSize: const Size(375, 40),
                    ),
                    child: model.isLoading
                        ? const AppLoader(
                            color: Colors.white,
                          )
                        : const Text("Submit"),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}
