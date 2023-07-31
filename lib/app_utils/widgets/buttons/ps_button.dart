import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

abstract class PSButton extends MaterialButton {
  final String buttonValue;
  final VoidCallback buttonPressed;

  const PSButton({Key? key, this.buttonValue = "", required this.buttonPressed})
      : super(key: key, onPressed: buttonPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: buttonPressed);
  }
}
