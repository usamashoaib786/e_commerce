import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_logout_pop_up.dart';
import 'package:tt_offer/View/Auction%20Info/make_offer_screen.dart';
import 'package:tt_offer/View/ChatScreens/provider_class.dart';

class AuctionInfoScreen extends StatefulWidget {
  final bool auction;
  const AuctionInfoScreen({super.key, required this.auction});

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
  static const List<String> bidList = [
    "\$26K",
    "\$28K",
    "\$32K",
    "\$45K",
    "use custom bid",
  ];
  static const List<String> wrapList1 = [
    'Used',
    'Samsung ',
    'Galaxy M02',
    "2/32",
    "Original"
  ];
  @override
  void initState() {
    _priceController.text = "\$ 60";
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final open = Provider.of<NotifyProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar:
            widget.auction == true ? auctionBottomCard() : featureBottomCard(),
        backgroundColor: AppTheme.whiteColor,
        bottomSheet: open.sheet == false
            ? const SizedBox.shrink()
            : Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    Container(
                      height: 104,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: AppTheme.appColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                    )
                  ],
                ),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 270,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: _imagePaths.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                _imagePaths[index],
                                fit: BoxFit.fill,
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
                                  color: const Color(
                                      0xffEDEDED), // Inactive dot color
                                  activeColor:
                                      AppTheme.appColor, // Active dot color
                                  size: const Size.square(8.0),
                                  activeSize: const Size(20.0, 8.0),
                                  spacing: const EdgeInsets.all(4.0),
                                ),
                              ),
                            ),
                          ),
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
                          child: AppText.appText("Modern light watch",
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
        ));
  }
////////////////////////////////////////////////// auction ///////////////////////////////////

  Widget auctionBottomCard() {
    final open = Provider.of<NotifyProvider>(context);

    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      elevation: 10,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bidList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            open.index(index: index);
                            if (index < bidList.length - 1) {
                              open.bidPrices(price: bidList[index]);
                            } else {
                              open.makeField();
                            }
                          },
                          child: Container(
                            height: 26,
                            decoration: BoxDecoration(
                                color: open.indexbid == index
                                    ? const Color(0xff14181B)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1, color: const Color(0xffBDBDBD))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: AppText.appText(bidList[index],
                                  textColor: open.indexbid == index
                                      ? AppTheme.whiteColor
                                      : const Color(0xff001B2E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    open.field == true
                        ? CustomAppFormField(
                            texthint: "",
                            controller: _priceController,
                            width: 161,
                            textAlign: TextAlign.center,
                            fontsize: 24,
                            fontweight: FontWeight.w600,
                            cPadding: 2.0,
                            type: TextInputType.number,
                          )
                        : AppButton.appButton("Place Bid for ${open.bidPrice}",
                            onTap: () {
                            showLogOutALert(context, 2500);
                          },
                            height: 53,
                            width: 200,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            radius: 32.0,
                            backgroundColor: AppTheme.appColor,
                            textColor: AppTheme.whiteColor),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (open.field == false) {
                              open.sheetTrue();
                            } else {}
                          },
                          child: Container(
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1, color: const Color(0xffBDBDBD))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(open.field == true
                                  ? "assets/images/correct.png"
                                  : "assets/images/arrowUp.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (open.field == false) {
                              open.sheetFalse();
                            } else {}
                          },
                          child: Container(
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1, color: const Color(0xffBDBDBD))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(open.field == true
                                  ? "assets/images/cancel.png"
                                  : "assets/images/arrowDown.png"),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

////////////////////////////////////////////////// feature ///////////////////////////////////
  Widget featureBottomCard() {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      elevation: 10,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
