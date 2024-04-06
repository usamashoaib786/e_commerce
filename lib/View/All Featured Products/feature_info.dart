import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tt_offer/Constants/app_logger.dart';
import 'package:tt_offer/Controller/APIs%20Manager/product_api.dart';
import 'package:tt_offer/Controller/provider_class.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/View/Auction%20Info/make_offer_screen.dart';
import 'package:tt_offer/View/Seller%20Profile/seller_profile.dart';
import 'package:tt_offer/config/dio/app_dio.dart';

class FeatureInfoScreen extends StatefulWidget {
  final detailResponse;
  const FeatureInfoScreen({super.key, this.detailResponse});

  @override
  State<FeatureInfoScreen> createState() => _FeatureInfoScreenState();
}

class _FeatureInfoScreenState extends State<FeatureInfoScreen> {
  int _currentPage = 0;
  final panelController = PanelController();

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  static const List<String> wrapList = [
    'Condition',
    'Brand',
    'Model',
    "Edition",
    "Authenticity"
  ];
  static const List<String> wrapList1 = [
    'Used',
    'Samsung ',
    'Galaxy M02',
    "2/32",
    "Original"
  ];
  late AppDio dio;
  AppLogger logger = AppLogger();
  @override
  void initState() {
    dio = AppDio(context);
    logger.init();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppTheme.whiteColor, body: bodyColumn());
  }

////////////////////////////////////////////////// feature ///////////////////////////////////
  Widget featureBottomCard() {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      elevation: 10,
      shadowColor: Colors.grey,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.appButton("Chat",
                height: 53,
                width: 150,
                radius: 32.0,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                backgroundColor: AppTheme.appColor,
                textColor: AppTheme.whiteColor),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                push(context, const MakeOfferScreen());
              },
              child: AppButton.appButton("Make Offer",
                  height: 53,
                  width: 150,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  radius: 32.0,
                  backgroundColor: AppTheme.appColor,
                  textColor: AppTheme.whiteColor),
            )
          ],
        ),
      ),
    );
  }
////////////////////////////////////////////////// custom ///////////////////////////////////

  Widget customColumn() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: screenWidth,
                child: AppText.appText(
                    "Its simple and elegant shape makes it perfect for those of you who like you who want minimalist watch. Its simple and elegant shape makes it perfect for those of you who like you who want minimalist watch.",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.lighttextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: AppText.appText(
                    "Posted on 15-09-2023 10:11 am Dhaka, Bangladesh",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.blackColor),
              ),
              Container(
                height: 1,
                width: screenWidth,
                decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 102,
                  width: screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText.appText("\$212.99",
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              textColor: AppTheme.appColor),
                          const SizedBox(
                            width: 20,
                          ),
                          AppText.appText("Negtiable",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: AppTheme.lighttextColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  push(context, const SellerProfileScreen());
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/auction2.png"),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              AppText.appText("Cameron Williamson",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppTheme.blackColor),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/verify.png",
                                height: 24,
                              ),
                              AppText.appText("Verified Member",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppTheme.blackColor),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AppText.appText("Member since August 2020",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            textColor: AppTheme.lighttextColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: screenWidth,
                decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i <= 4; i++)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                AppText.appText("${wrapList[i]}  ",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppTheme.lighttextColor),
                                AppText.appText(wrapList1[i],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppTheme.textColor),
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Container(
                height: 1,
                width: screenWidth,
                decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget bodyColumn() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _pageController,
                              itemCount: widget.detailResponse["photo"].length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 300,
                                  child: Image.network(
                                    "${widget.detailResponse["photo"][index]["src"]}",
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              onPageChanged: (int index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 30),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.whiteColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/arrow-left.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            iconContainer(
                                ontap: () {
                                  Navigator.pop(context);
                                },
                                alignment: Alignment.topLeft,
                                img: "assets/images/arrow-left.png"),
                            iconContainer(
                                ontap: () {},
                                alignment: Alignment.topRight,
                                img: "assets/images/heart.png")
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 20, right: 20),
                            child: AppText.appText(
                                "${widget.detailResponse["title"]}",
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: AppTheme.textColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                customColumn(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: featureBottomCard(),
        )
      ],
    );
  }

  Widget iconContainer({Function()? ontap, img, alignment}) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Align(
          alignment: alignment,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppTheme.whiteColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("$img"),
            ),
          ),
        ),
      ),
    );
  }
}
