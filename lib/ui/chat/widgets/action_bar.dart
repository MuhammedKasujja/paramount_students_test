import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import '../enum_constants.dart';

class ActionBar extends StatefulWidget {
  final UserActions? action;
  final Function cancel;
  const ActionBar(this.action, this.cancel, {super.key});

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      children: [
        const Spacing.smallHeight(),
        Container(
          decoration: const BoxDecoration(color: psGrey6),
          padding: const EdgeInsets.only(
            right: 15,
            top: 5,
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.action == UserActions.Delete_Msg
                        ? const Icon(
                            Icons.delete,
                            color: psBlack1,
                          )
                        : const Icon(
                            Icons.edit,
                            color: psBlack1,
                          ),
                    const Spacing.smallWidth(),
                    sText(
                        widget.action == UserActions.Delete_Msg
                            ? 'Delete'
                            : 'Edit',
                        size: isLandscape ? 17 : 15),
                  ],
                ),
              ),
              const Spacing.smallWidth(),
              TextButton(
                onPressed: () => widget.cancel(null),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cancel, color: psBlack1),
                    const Spacing.smallWidth(),
                    sText('Cancel', size: isLandscape ? 17 : 15),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacing.smallHeight(),
      ],
    );
  }
}
