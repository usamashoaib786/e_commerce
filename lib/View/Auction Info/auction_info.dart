import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class AuctionInfoScreen extends StatefulWidget {
  const AuctionInfoScreen({super.key});

  @override
  State<AuctionInfoScreen> createState() => _AuctionInfoScreenState();
}

class _AuctionInfoScreenState extends State<AuctionInfoScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  static const List<String> _imagePaths = [
    'assets/images/auction1.png',
    'assets/images/auction1.png',
    'assets/images/auction1.png',
  ];

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.fitWidth,
                      );
                    },
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DotsIndicator(
                        dotsCount: _imagePaths.length,
                        position: _currentPage,
                        decorator: DotsDecorator(
                          color: const Color(0xffEDEDED), // Inactive dot color
                          activeColor: AppTheme.appColor, // Active dot color
                          size: const Size.square(8.0),
                          activeSize: const Size(20.0, 8.0),
                          spacing: const EdgeInsets.all(4.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 400,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: customColumn(),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              elevation: 10,
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
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
                    AppButton.appButton("Make Offer",
                        height: 53,
                        width: 150,
                         fontWeight: FontWeight.w500,
                    fontSize: 14,
                        radius: 32.0, 
                        backgroundColor: AppTheme.appColor,
                        textColor: AppTheme.whiteColor)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget customColumn() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: AppText.appText("Modern light watch",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textColor: AppTheme.textColor),
            ),
            Container(
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
                            Container(
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
                              AppText.appText("${wrapList1[i]}",
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
      ),
    );
  }
}
