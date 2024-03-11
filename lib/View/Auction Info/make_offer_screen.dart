import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/ChatScreens/offer_chat_screen.dart';
import 'package:tt_offer/View/ChatScreens/provider_class.dart';
import 'package:tt_offer/View/Profile%20Screen/profile_screen.dart';

class MakeOfferScreen extends StatefulWidget {
  const MakeOfferScreen({super.key});

  @override
  State<MakeOfferScreen> createState() => _MakeOfferScreenState();
}

class _MakeOfferScreenState extends State<MakeOfferScreen> {
  final TextEditingController _priceController = TextEditingController();
  @override
  void initState() {
    _priceController.text = "\$ 60";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar1(
        title: "Make Your Offer",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 70,
                  width: screenSize.width,
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/auction1.png"),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.appText("Modern light clothes",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              textColor: AppTheme.txt1B20),
                          const StarRating(
                            rating: 2,
                            color: Colors.amber,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  AppText.appText("Enter Your Offer",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: AppTheme.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAppFormField(
                    texthint: "",
                    controller: _priceController,
                    width: 161,
                    textAlign: TextAlign.center,
                    fontsize: 24,
                    fontweight: FontWeight.w600,
                    cPadding: 2.0,
                    type: TextInputType.number,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: AppButton.appButton("Send Offer", onTap: () {
                  push(context, const OfferChatScreen());
                },
                    height: 53,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    radius: 32.0,
                    backgroundColor: AppTheme.appColor,
                    textColor: AppTheme.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
