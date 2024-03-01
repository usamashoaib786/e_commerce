import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/Authentication%20screens/otp_screen.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        context: context,
        title: "Email",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/email.png",
                      height: 165,
                      width: 201,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                child: AppText.appText("Email",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff090B0C)),
              ),
              CustomAppFormField(
                texthint: "Email",
                controller: _emailController,
                hintTextColor: Color(0xff939699),
                borderColor: Color(0xffE5E9EB),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: AppButton.appButton("Send OTP", onTap: () {
                  push(context, OTPScreen(email: true,));
                },
                    height: 53,
                    radius: 32.0,
                     fontWeight: FontWeight.w500,
                    fontSize: 14,
                    backgroundColor: AppTheme.appColor,
                    textColor: AppTheme.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
