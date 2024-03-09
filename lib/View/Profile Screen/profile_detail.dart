import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: CustomAppBar1(
        context: context,
        title: "Profile Detail",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/profileDetail.png",
                      height: 142,
                      width: 146,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customColumn(
                      width: MediaQuery.of(context).size.width * 0.4,
                      txt: "First Name",
                      hintTxt: "First Name",
                      controller: _fNameController),
                  customColumn(
                      width: MediaQuery.of(context).size.width * 0.4,
                      txt: "Last Name",
                      hintTxt: "Last Name",
                      controller: _lNameController),
                ],
              ),
              customColumn(
                  txt: "Username",
                  hintTxt: "Username",
                  controller: _userNameController),
              customColumn(
                  txt: "Email/Phone",
                  hintTxt: "Email/Phone",
                  controller: _emailController),
              customColumn(
                  txt: "Password",
                  hintTxt: "Password",
                  controller: _passwordController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButton("Confirm", onTap: () {
                  push(context, const BottomNavView());
                },
                    height: 53,
                     fontWeight: FontWeight.w500,
                    fontSize: 14,
                    radius: 32.0,
                    backgroundColor: AppTheme.appColor,
                    textColor: AppTheme.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customColumn({txt, hintTxt, controller, width}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.appText("$txt",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          const SizedBox(
            height: 10,
          ),
          CustomAppFormField(
            width: width ?? MediaQuery.of(context).size.width,
            texthint: "$hintTxt",
            controller: controller,
            borderColor: AppTheme.borderColor,
            hintTextColor: AppTheme.hintTextColor,
          )
        ],
      ),
    );
  }


}
