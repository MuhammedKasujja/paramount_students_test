import 'package:flutter/material.dart';

class PopUpCard extends StatelessWidget {
  const PopUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Email Address",
                style: TextStyle(
                  color: Color(0xff191c1c),
                  fontSize: 12,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          const SizedBox(height: 5.50),
          const SizedBox(
            height: 100,
            child: Text(
              overflow: TextOverflow.ellipsis,
              "Please provide your continuously used email address. Once you submit the email address, all correspondence will be directed to that email address for your convenience",
              style: TextStyle(
                color: Color(0xff191c1c),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
