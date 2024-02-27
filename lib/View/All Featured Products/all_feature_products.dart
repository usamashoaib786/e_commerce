import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/Auction%20Info/auction_info.dart';

class ViewFeaturedProducts extends StatefulWidget {
  const ViewFeaturedProducts({super.key});

  @override
  State<ViewFeaturedProducts> createState() => _ViewFeaturedProductsState();
}

class _ViewFeaturedProductsState extends State<ViewFeaturedProducts> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar1(
        title: "Featured Products",
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
              child: Container(
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
                  childAspectRatio: screenWidth / (2.6 * 220),
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return SizedBox(
                    height: 245,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 161,
                          width: 161,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/auction1.png"),
                                  fit: BoxFit.fitWidth)),
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
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                AppText.appText("5.0",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppTheme.textColor),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppTheme.textColor,
                                  size: 20,
                                ),
                                AppText.appText("Belarus",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppTheme.textColor)
                              ],
                            ),
                            AppText.appText("2 Week ago",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: AppTheme.appColor),
                          ],
                        ),
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
