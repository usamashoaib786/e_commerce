import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/Auction%20Info/auction_info.dart';

class ViewAllAuctionProducts extends StatefulWidget {
  const ViewAllAuctionProducts({super.key});

  @override
  State<ViewAllAuctionProducts> createState() => _ViewAllAuctionProductsState();
}

class _ViewAllAuctionProductsState extends State<ViewAllAuctionProducts> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: const CustomAppBar1(
        title: "Auction Products",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomAppFormField(
                height: 40,
                radius: 15.0,
                prefixIcon: Image.asset(
                  "assets/images/search.png",
                  height: 17,
                  color: AppTheme.textColor,
                ),
                texthint: "Search",
                controller: _searchController,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SizedBox(
                height: 20,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customRow(
                        img: "assets/images/location.png", txt: "Belarus"),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppTheme.blackColor,
                    ),
                    customRow(
                        img: "assets/images/category.png", txt: "All Category"),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppTheme.blackColor,
                    ),
                    customRow(img: "assets/images/filter.png", txt: "Filter"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: screenWidth / (3.8 * 220),
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      push(context, const AuctionInfoScreen());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 225,
                          width: 161,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/auction1.png"),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.whiteColor),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 13,
                                  color: AppTheme.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppText.appText("Modern light clothes",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppTheme.textColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.appText("\$212.99",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                textColor: AppTheme.textColor),
                            AppText.appText("1 Bid Now",
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                textColor: AppTheme.textColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.appText("Time Left:",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                textColor: AppTheme.textColor),
                            AppText.appText("1 Day 5 Hours",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: AppTheme.appColor),
                          ],
                        ),
                        AppButton.appButton("Get Started",
                            onTap: () {},
                            height: 32,
                            width: 161,
                            radius: 16.0,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            backgroundColor: AppTheme.appColor,
                            textColor: AppTheme.whiteColor)
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customRow({img, txt}) {
    return Row(
      children: [
        Image.asset(
          "$img",
          height: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        AppText.appText("$txt",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textColor: AppTheme.textColor)
      ],
    );
  }
}
