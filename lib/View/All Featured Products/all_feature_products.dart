import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/All%20Featured%20Products/feature_container.dart';
import 'package:tt_offer/View/Auction%20Info/auction_info.dart';

class ViewFeaturedProducts extends StatefulWidget {
  const ViewFeaturedProducts({super.key});

  @override
  State<ViewFeaturedProducts> createState() => _ViewFeaturedProductsState();
}

class _ViewFeaturedProductsState extends State<ViewFeaturedProducts> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
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
                  childAspectRatio: screenWidth / (2.6 * 220),
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                      onTap: () {
                        push(
                            context,
                            const AuctionInfoScreen(
                              auction: false,
                            ));
                      },
                      child: const FeatureProductContainer());
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
