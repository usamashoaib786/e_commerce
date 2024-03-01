import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/Authentication%20screens/otp_screen.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _phoneController.text = "+375";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        context: context,
        title: "Phone",
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
                      "assets/images/phoneAuth.png",
                      height: 165,
                      width: 201,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                child: AppText.appText("Phone",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff090B0C)),
              ),
              phoneField(controller: _phoneController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: AppButton.appButton("Send OTP", onTap: () {
                  push(
                      context,
                      OTPScreen(
                        email: false,
                      ));
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

  Widget phoneField({controller}) {
    String _initialCountry = "by";
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          border: Border.all(color: Color(0xffE5E9EB)),
          borderRadius: BorderRadius.circular(14)),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CountryListPick(
            onChanged: (CountryCode? countryCode) {
              controller.text = countryCode?.dialCode ?? '';
            },
            theme: CountryTheme(
                isShowFlag: true,
                showEnglishName: true,
                isShowTitle: false,
                isShowCode: false,
                isDownIcon: false),
            initialSelection: _initialCountry,
            useUiOverlay: false,
            useSafeArea: false,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: AppTheme.textColor,
              cursorHeight: 25,
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                  fillColor: Colors.black38,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 4)),
            ),
          ),
        ],
      ),
    );
  }
}
