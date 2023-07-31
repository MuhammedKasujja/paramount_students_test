import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/extensions/validation_extension.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/app_textfield.dart';
import 'package:paramount_students/core/measureWidgetSize/measure_widget_size.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
// import 'package:paramount_students/ui/auth/registration/widgets/pop_up_card.dart';
import 'package:paramount_students/ui/auth/registration/widgets/reg_string_list_dropdown_field.dart';
import 'package:paramount_students/utils/ps_color.dart';

// import 'package:popover/popover.dart';

import '../../../../../app_utils/helper/helper.dart';

class ProfileForm extends StatefulWidget {
  final RegisterationViewModel registerationViewModel;
  const ProfileForm({Key? key, required this.registerationViewModel})
      : super(key: key);

  static final _formKey = GlobalKey<FormState>();

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final SizedBox titleSeparator = const SizedBox(
    height: 8,
  );

  final SizedBox fieldSeparator = const SizedBox(
    height: 18,
  );
  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<String> gender = ['Male', 'Female', 'Prefer Not to disclose'];

  Size childWidgetSize = Size.zero;

  @override
  void initState() {
    for (var focusNode in focus) {
      focusNode.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  final requiredField = Text(
    ' *',
    style: TextStyle(color: HexColor('#DD3730')),
  );

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
          key: ProfileForm._formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              fieldSeparator,
              Row(
                children: [
                  const Text('First Name'),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                controller: widget.registerationViewModel.firstNameController,
                hintText: 'First Name',
                validateFunction: context.validateFieldNotEmpty,
                textInputType: TextInputType.name,
              ),
              fieldSeparator,
              Row(
                children: [
                  const Text('last Name'),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                controller: widget.registerationViewModel.lastNameController,
                hintText: 'Last Name',
                validateFunction: context.validateFieldNotEmpty,
                textInputType: TextInputType.name,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psFatherName),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                controller: widget.registerationViewModel.fatherNameController,
                validateFunction: context.validateFieldNotEmpty,
                textInputType: TextInputType.name,
                hintText: PSStrings.psFatherNameHint,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psMotherName),
                  requiredField,
                ],
              ),
              titleSeparator,
              AppTextField(
                textInputAction: TextInputAction.next,
                controller: widget.registerationViewModel.motherNameController,
                validateFunction: context.validateFieldNotEmpty,
                textInputType: TextInputType.name,
                hintText: PSStrings.psMotherNameHint,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psDOB),
                  requiredField,
                ],
              ),
              titleSeparator,
              GestureDetector(
                onTap: (() async => widget.registerationViewModel
                    .openDatePicker(
                        context: context,
                        isItForBOD: true,
                        isItForPassportIssueDate: false)),
                child: AppTextField(
                  textInputAction: TextInputAction.next,
                  controller: widget.registerationViewModel.dobController,
                  textInputType: TextInputType.datetime,
                  hintText: PSStrings.psDateHint,
                  focusNode: focus[0],
                  enabled: false,
                  suffixIcon: Icon(
                    Icons.date_range_outlined,
                    color: focus[0].hasFocus ? appYellowText : appGray,
                  ),
                ),
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psGender),
                  requiredField,
                ],
              ),
              titleSeparator,
              RegStringListDropdownField(
                focusNode: focus[1],
                description: 'Specify your gender',
                list: gender,
                controller: widget.registerationViewModel.genderController,
              ),
              fieldSeparator,
              Row(
                children: [
                  Text(PSStrings.psEmail),
                  requiredField,
                ],
              ),
              titleSeparator,
              // AppTextField(
              //   controller: widget.registerationViewModel.emailController,
              //   validateFunction: context.validateEmailAddress,
              //   textInputType: TextInputType.emailAddress,
              //   hintText: PSStrings.psEmailHint,
              //   suffixIcon: GestureDetector(
              //     onTap: () {
              //       showPopover(
              //         context: context,
              //         bodyBuilder: (context) => const PopUpCard(),
              //         onPop: () => print('Popover was popped! loki'),
              //         direction: PopoverDirection.top,
              //         width: 300,
              //         height: 250,
              //         // arrowHeight: 15,
              //         // arrowWidth: 30,
              //         radius: 16,
              //       );
              //     },
              //     child: Icon(
              //       Icons.info,
              //       color: focus[2].hasFocus ? appYellowText : appGray,
              //     ),
              //   ),
              // ),
              AppTextField(
                controller: widget.registerationViewModel.emailController,
                validateFunction: context.validateEmailAddress,
                textInputType: TextInputType.emailAddress,
                hintText: PSStrings.psEmailHint,
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showTextFieldInfo(
                      context: context,
                      noOfRowTextFieldWidgets: 7,
                      parentWidgetSize: childWidgetSize,
                      currentRowTextFieldWidgetIndex: 7,
                      data: PSStrings.psEmailInfo,
                      dataTitle: PSStrings.psEmailInfoTitle,
                    );
                  },
                  icon: Icon(
                    Icons.info,
                    color: focus[2].hasFocus ? appYellowText : appGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
