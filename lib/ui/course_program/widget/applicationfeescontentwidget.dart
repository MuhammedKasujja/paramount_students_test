import 'package:flutter/material.dart';

class ApplicationFeesContentWidget extends StatefulWidget {
  final String studentType;
  final String amount;
  final String description;
  const ApplicationFeesContentWidget({
    super.key,
    required this.studentType,
    required this.amount,
    required this.description,
  });

  @override
  State<ApplicationFeesContentWidget> createState() =>
      _ApplicationFeesContentWidgetState();
}

class _ApplicationFeesContentWidgetState
    extends State<ApplicationFeesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.studentType,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  Image.asset('assets/images/dollar.png'),
                  const SizedBox(
                    width: 7,
                  ),
                  Column(children: [
                    Text(
                      '${widget.amount}\$',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.studentType,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  Image.asset('assets/images/dollar.png'),
                  const SizedBox(
                    width: 7,
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Text(
                        '${widget.amount}\$',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
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
        ],
      ),
    );
  }
}
