import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/View/Authentication%20screens/login_screen.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                AppText.appText("WELCOME TO TT OFFER",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textColor: AppTheme.blackColor),
                AppText.appText("Discover, chat, bid, and shop with ease",
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    textColor: AppTheme.blackColor),
              ],
            ),
            Image.asset("assets/images/onBorad.png"),
            AppButton.appButton("Get Started", onTap: () {
              push(context, SigInScreen());
            },
                height: 53,
                radius: 32.0,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                backgroundColor: AppTheme.appColor,
                textColor: AppTheme.whiteColor)
          ],
        ),
      ),
    );
  }
}
