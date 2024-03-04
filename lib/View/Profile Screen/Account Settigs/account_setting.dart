import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/Profile%20Screen/Account%20Settigs/account_info_edit.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: const CustomAppBar1(
        title: "Account Setting",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "User Name",
                        lable: "Your Name",
                        infoText: "John Doe",
                      ));
                },
                img: "assets/images/profile.png",
                txt: "John Doe"),
            divider(),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "Phone Number",
                        lable: "Your Number",
                        infoText: "+33434 343434",
                      ));
                },
                img: "assets/images/call.png",
                txt: "+33434 343434"),
            divider(),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "Email Address",
                        lable: "Your Email",
                        infoText: "johndoe@gmail.com",
                        email: true,
                      ));
                },
                img: "assets/images/sms.png",
                txt: "johndoe@gmail.com"),
            divider(),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "Password",
                        lable: "Old Password",
                        infoText: "************",
                        password: true,
                      ));
                },
                img: "assets/images/password.png",
                txt: "************"),
            divider(),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "Location",
                        lable: "Your Location",
                        infoText: "Belarus",
                        location: true,
                      ));
                },
                img: "assets/images/location.png",
                txt: "Belarus"),
            divider(),
            customRow(
                onTap: () {
                  push(
                      context,
                      const AccountEditInfoScreen(
                        title: "User Name",
                        lable: "Your Name",
                        infoText: "John Doe",
                      ));
                },
                img: "assets/images/join.png",
                txt: "Join TruYou"),
            divider(),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffEAEAEA),
        ));
  }

  Widget customRow({img, txt, required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "$img",
                  height: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                AppText.appText("$txt",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.txt1B20),
              ],
            ),
            Image.asset(
              "assets/images/arrowFor.png",
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
