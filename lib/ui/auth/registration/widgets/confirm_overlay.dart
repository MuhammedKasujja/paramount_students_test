import 'package:flutter/material.dart';

class ConfirmOverlay extends StatelessWidget {
  const ConfirmOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(child: Dialog());
  }
}
