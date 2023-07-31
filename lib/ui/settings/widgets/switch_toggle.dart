import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class SwitchToggle extends StatelessWidget {
  final bool isActive;
  final Function(bool isActive) onToggle;
  const SwitchToggle({
    super.key,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) { 
    return FlutterSwitch(
      width: 48.0,
      height: 24.0,
      value: isActive,
      inactiveColor: const Color(0xFFE6E6E6),
      activeColor: appYellowText,
      inactiveToggleColor: appBlackText,
      padding: 2,
      onToggle: onToggle,
    );
  }
}
