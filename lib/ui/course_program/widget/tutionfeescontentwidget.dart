import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
// import '../../../models/programs_model/tuition_fee.dart';

class TutionFeesContentWidget extends StatefulWidget {
  final String studentType;
  final String paymentType;
  final String amount;
  final String scholarshipPercent;
  final String description;

  const TutionFeesContentWidget({
    super.key,
    required this.studentType,
    required this.paymentType,
    required this.amount,
    required this.scholarshipPercent,
    required this.description,
  });

  @override
  State<TutionFeesContentWidget> createState() =>
      _TutionFeesContentWidgetState();
}

class _TutionFeesContentWidgetState extends State<TutionFeesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.studentType,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset('assets/images/cashbag.png'),
                const SizedBox(
                  width: 7,
                ),
                Column(children: [
                  Text(
                    '${widget.amount} /Per Year',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${widget.scholarshipPercent}percent scholarship',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ]),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.description,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(113, 113, 113, 1)),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const Spacing.tinyHeight(),
      ],
    );
  }
}

class TuittionFeeList extends StatelessWidget {
  const TuittionFeeList({super.key, required this.tuitionList});
  final List<TuitionFees> tuitionList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tuitionList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final tuition = tuitionList[index];
        return TutionFeesContentWidget(
          description: tuition.comment.toString(),
          amount: tuition.amount.toString(),
          paymentType: tuition.paymentType.toString(),
          scholarshipPercent: tuition.scholarshipPercent.toString(),
          studentType: tuition.studentType.toString(),
        );
      },
    );
  }
}
