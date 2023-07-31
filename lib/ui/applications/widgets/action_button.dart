import "package:flutter/material.dart";
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/applications/widgets/view_application/view_application_program.dart';
import '../models/models.dart';

class ActionButton extends StatelessWidget {
  final Program program;
  const ActionButton({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return program.status == ProgramState.rejected
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 24),
            child: SizedBox(
              width: double.infinity,
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  goTo(context, ViewApplicationProgram(program: program));
                },
                child: Text.rich(
                  TextSpan(
                    text: program.status == ProgramState.pending
                        ? 'Resume'
                        : program.status == ProgramState.submitted
                            ? 'Edit'
                            : "View",
                    children: const [TextSpan(text: " Application")],
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: appBlackText,
                  ),
                ),
              ),
            ),
          );
  }
}
