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
  final TextEditingController _locationController = TextEditingController();

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
                      img: "assets/images/location.png",
                      txt: "Belarus",
                      onTap: () {
                        _showLocationBottomSheet(context);
                      },
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppTheme.blackColor,
                    ),
                    customRow(
                      img: "assets/images/category.png",
                      txt: "All Category",
                      onTap: () {
                        print("kfn4f");
                        _showCategoryBottomSheet(context);
                      },
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppTheme.blackColor,
                    ),
                    customRow(
                      img: "assets/images/filter.png",
                      txt: "Filter",
                      onTap: () {},
                    ),
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
                      push(
                          context,
                          const AuctionInfoScreen(
                            auction: true,
                          ));
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

  Widget customRow({img, txt, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AppText.appText(
                      "Categories",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomAppFormField(
                    radius: 15.0,
                    prefixIcon: Image.asset(
                      "assets/images/search.png",
                      height: 17,
                      color: AppTheme.textColor,
                    ),
                    texthint: "Search",
                    controller: _searchController,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: _buildCategoryList(setState),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildCategoryList(StateSetter setState) {
    List<String> categories = [
      "Electronic And Media",
      "Home And Garden",
      "Clothing, Shoes & Acessories",
      " Baby & Kids",
      "Vehicles",
      "Toys, Games & Hobbies",
      " Collectibles & Arts",
      "Pet Supplies",
      "Healthy & Beauties ",
      "Wedding",
    ];

    return categories.map((category) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.appText(category,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: const Color(0xff1B2028)),
            Image.asset(
              "assets/images/arrowFor.png",
              height: 16,
            )
          ],
        ),
      );
    }).toList();
  }

  void _showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AppText.appText(
                      "Location",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppText.appText("Address",
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customLocationRow(txt1: "City", txt2:"New York"),
                      customLocationRow(txt1: "State", txt2:"California"),
                      customLocationRow(txt1: "Zip", txt2:"3254"),
                    ],
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget customLocationRow({txt1, txt2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.appText("$txt1",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            textColor: AppTheme.textColor),
        const SizedBox(
          height: 10,
        ),
        CustomAppFormField(
          texthint: "$txt2",
          controller: _locationController,
          borderColor: const Color(0xffE5E9EB),
          hintTextColor: AppTheme.hintTextColor,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      ],
    );
  }
}
