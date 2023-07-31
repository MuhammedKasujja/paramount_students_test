import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/auth/login/view_model/login_view_model.dart';
import 'package:paramount_students/ui/index.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.model}) : super(key: key);
  final LoginViewModel model;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  CountdownTimerController? controller;
  final TextEditingController otpcontroller = TextEditingController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  void dispose() {
    otpcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final channelsStore = Provider.of<Store>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 41, bottom: 20),
        children: [
          sText("OTP", size: 30, color: Colors.black, weight: FontWeight.bold),
          const SizedBox(
            height: 40,
          ),
          sText(
            "You only have to enter an OTP code we sent via SMS/MAIL to your registered cell phone number/mail address in Paramount Students",
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: sText(
                ' ${widget.model.emailController.text.isEmpty ? widget.model.mobileController.text : widget.model.emailController.text}',
                weight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Pinput(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            length: 4,
            controller: otpcontroller,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: sText('Resend Code', color: Colors.black),
              ),
              CountdownTimer(
                endTime: endTime,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return sText('The current time has expired',
                        color: Colors.grey);
                  }
                  return Row(
                    children: [
                      sText('${time.min ?? "00"} : ${time.sec}',
                          color: Colors.black),
                      const Icon(
                        Icons.timer,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: MaterialButton(
              height: 50,
              minWidth: 380,
              onPressed: () async {
                setState(() {});
                if (otpcontroller.text.isNotEmpty) {
                  final bool verified = await widget.model
                      .verifyOTP(otp: int.parse(otpcontroller.text), channelStore: channelsStore, context: context, );
                  if (verified) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const IndexPage()));
                  } else {
                    toastMessage('Please Try Again');
                  }
                } else {
                  toastMessage('Pleae Enter OTP');
                }
                setState(() {});
              },
              color: appYellowText,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: widget.model.verifyOTPLoading
                  ? const AppLoader(
                      size: 80,
                      color: psGrey1,
                    )
                  : sText("Submit", color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
