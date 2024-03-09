import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/add_post_detail.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar:  CustomAppBar1(
        title: "Post an Item",
         actionOntap: () {
          pushUntil(context, const BottomNavView());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              StepsIndicator( conColor1: AppTheme.appColor, circleColor1: AppTheme.appColor,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButtonWithLeadingImage("Take Photo",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.textColor,
                    imagePath: "assets/images/camera.png",
                    imgHeight: 20,
                    height: 48,
                    space: 20.0),
              ),
              AppButton.appButtonWithLeadingImage("Select Image",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor,
                  imagePath: "assets/images/gallery1.png",
                  imgHeight: 20,
                  height: 48,
                  space: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButtonWithLeadingImage("Select Vedio",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.textColor,
                    imagePath: "assets/images/video.png",
                    imgHeight: 20,
                    height: 48,
                    space: 20.0),
              ),
              AppText.appText("Add your cover photo first",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor),
              customColumn(txt: "Title", hintTxt: "Title"),
              customColumn(
                  txt: "Description (Optional)",
                  hintTxt: "Description",
                  maxline: 3,
                  height: 100.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButton("Next", onTap: () {
                  push(context, const PostDetailScreen());
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
