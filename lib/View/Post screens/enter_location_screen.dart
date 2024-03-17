import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/Utils/widgets/others/divider.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';
import 'package:tt_offer/View/Post%20screens/post_product_payment.dart';

class PostLocationScreen extends StatefulWidget {
  const PostLocationScreen({super.key});

  @override
  State<PostLocationScreen> createState() => _PostLocationScreenState();
}

class _PostLocationScreenState extends State<PostLocationScreen> {
  final TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton.appButton("Next", onTap: () {
          push(context, const PostProductPayment());
        },
            height: 53,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            radius: 32.0,
            backgroundColor: AppTheme.appColor,
            textColor: AppTheme.whiteColor),
      ),
      backgroundColor: AppTheme.whiteColor,
      appBar: CustomAppBar1(
        title: "Finish",
        actionOntap: () {
          pushUntil(context, const BottomNavView());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: StepsIndicator(
                  conColor1: AppTheme.appColor,
                  circleColor1: AppTheme.appColor,
                  circleColor2: AppTheme.appColor,
                  conColor2: AppTheme.appColor,
                  conColor3: AppTheme.appColor,
                  circleColor3: AppTheme.appColor,
                  circleColor4: AppTheme.appColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomDivider(),
              const SizedBox(
                height: 20,
              ),
              AppText.appText("Set a Location (Required)",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  textColor: AppTheme.textColor),
              const SizedBox(
                height: 10,
              ),
              CustomAppFormField(
                texthint: "Set a loction",
                controller: _locationController,
                borderColor: const Color(0xffE5E9EB),
                hintTextColor: AppTheme.hintTextColor,
                suffixIcon: Image.asset(
                  "assets/images/location.png",
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/shipping.png"),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: AppText.appText("Ship, ship, Hooray! ",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    textColor: AppTheme.blackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: AppText.appText(
                    "Accelerate the sale of your item by making it available to millions of buyers across the country.",
                    fontSize: 12,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customColumn({txt, hintTxt, controller, width, maxline, height}) {
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
            maxline: maxline,
            height: height,
            width: MediaQuery.of(context).size.width,
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
