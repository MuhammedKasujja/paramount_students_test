import 'package:flutter/material.dart';

class AdmissionDeadlineContentWidget extends StatefulWidget {
  final String semesterName;
  final String startDate;
  final String endDate;
  final String description;
  const AdmissionDeadlineContentWidget({
    super.key,
    required this.semesterName,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  @override
  State<AdmissionDeadlineContentWidget> createState() =>
      _AdmissionDeadlineContentWidgetState();
}

class _AdmissionDeadlineContentWidgetState
    extends State<AdmissionDeadlineContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.semesterName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/calender.png'),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.startDate,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Text(
                          'start Date',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/calender.png'),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.endDate,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text(
                          'End date',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          widget.description,
          style: const TextStyle(
              color: Color.fromRGBO(113, 113, 113, 1),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Divider(
        //     color: Colors.grey,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 13.0),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       widget.semesterName,
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Image.asset('assets/images/calender.png'),
        //           SizedBox(
        //             width: 6,
        //           ),
        //           Column(
        //             children: [
        //               Text(
        //                 widget.startDate,
        //                 style: TextStyle(
        //                     fontSize: 16, fontWeight: FontWeight.w500),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(right: 30.0),
        //                 child: Text(
        //                   'start Date',
        //                   style: TextStyle(
        //                       fontSize: 8, fontWeight: FontWeight.w400),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Image.asset('assets/images/calender.png'),
        //           SizedBox(
        //             width: 6,
        //           ),
        //           Column(
        //             children: [
        //               Text(
        //                 widget.endDate,
        //                 style: TextStyle(
        //                     fontSize: 16, fontWeight: FontWeight.w500),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(right: 50.0),
        //                 child: Text(
        //                   'End date',
        //                   style: TextStyle(
        //                       fontSize: 8, fontWeight: FontWeight.w400),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
