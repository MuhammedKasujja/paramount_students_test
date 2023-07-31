import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';

final registerationViewModel = RegisterationViewModel();

class RegStringListDropdownField extends StatefulWidget {
  final List<String> list;
  final String description;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const RegStringListDropdownField({
    Key? key,
    required this.list,
    required this.description,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  State<RegStringListDropdownField> createState() =>
      _RegStringListDropdownFieldState();
}

class _RegStringListDropdownFieldState
    extends State<RegStringListDropdownField> {
  OutlineInputBorder border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );
  TextStyle hintTextStyle = const TextStyle(
    fontSize: 14.0,
  );

  String? selectedValue;
  List<String> dropdownList = [];

  @override
  void initState() {
    super.initState();
    selectedValue = null; // Set initial value to null
  }

  @override
  Widget build(BuildContext context) {
    dropdownList.replaceRange(
        0, dropdownList.length, widget.list.toSet().toList());

    log('dropdownlist: $dropdownList');

    if (!dropdownList.contains(widget.description)) {
      dropdownList.insert(0, widget.description);
    }

    if (!dropdownList.contains(selectedValue)) {
      selectedValue = dropdownList.first;
    }

    return DropdownButtonFormField<String>(
      focusNode: widget.focusNode,
      iconEnabledColor: appGray,
      value: selectedValue,
      items: dropdownList.map((String choice) {
        return DropdownMenuItem(
          value: choice,
          child: Text(
            choice,
            style: hintTextStyle,
          ),
        );
      }).toList(),
      onChanged: (value) async {
        setState(() {
          selectedValue = value;
        });
        if (selectedValue != widget.description) {
          await registerationViewModel.getDropdownUserChoice(
            userChoice: selectedValue!,
            controller: widget.controller,
          );
        }
      },
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      ),
    );
  }
}
