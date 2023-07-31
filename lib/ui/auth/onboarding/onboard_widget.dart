import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/ui/auth/login/view/login.dart';

class OnBoardWidget extends StatelessWidget {
  final String? text;
  final String assetImage;
  final int page;

  const OnBoardWidget(
      {Key? key, this.text, required this.assetImage, this.page = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetImage), fit: BoxFit.fitWidth),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(25, 28, 28, 1),
                      Color.fromRGBO(18, 41, 82, 0.28),
                    ],
                    begin: Alignment.bottomCenter,
                    stops: [0.2, 1.0])),
          ),
          if (page == 1)
            Positioned(
              top: 55,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  navigateTo(context, const Login());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      sText("Skip", color: Colors.white),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text ?? "",
              style: PSTextStyle.onBoardingTextStyle,
            ),
          ),
        )
      ]),
    );
  }
}
