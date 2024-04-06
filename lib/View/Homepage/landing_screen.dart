import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_offer/Constants/app_logger.dart';
import 'package:tt_offer/Controller/APIs%20Manager/product_api.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/loading_popup.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/View/All%20Aucton%20Products/all_auction_procucts.dart';
import 'package:tt_offer/View/All%20Aucton%20Products/auction_container.dart';
import 'package:tt_offer/View/All%20Categories/all_caetgories.dart';
import 'package:tt_offer/View/All%20Categories/catagory_container.dart';
import 'package:tt_offer/View/All%20Featured%20Products/all_feature_products.dart';
import 'package:tt_offer/View/All%20Featured%20Products/feature_container.dart';
import 'package:tt_offer/View/Auction%20Info/auction_info.dart';
import 'package:tt_offer/View/Homepage/home_app_bar.dart';
import 'package:tt_offer/config/dio/app_dio.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _searchController = TextEditingController();
  static const List<String> _imagePaths = [
    "assets/images/sliderImg.png",
    "assets/images/sliderImg.png",
    "assets/images/sliderImg.png",
  ];
  late AppDio dio;
  AppLogger logger = AppLogger();
  @override
  void initState() {
    dio = AppDio(context);
    logger.init();
    final apiProvider =
        Provider.of<ProductsApiProvider>(context, listen: false);
    apiProvider.getCatagories(
        dio: dio, context: context, limit: 6, aucProduct: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ProductsApiProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    print("kfknf${apiProvider.auctionProductsData}");
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: CustomAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomAppFormField(
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
              const SizedBox(
                height: 20,
              ),
              apiProvider.isLoading == true
                  ? LoadingDialog()
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: _imagePaths.map((String imagePath) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 154,
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            imagePath,
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customRow(
                            txt1: "Categories",
                            txt2: "View All",
                            txt3: "",
                            onTap: () {
                              push(
                                  context,
                                  AllCategories(
                                    data: apiProvider.catagoryData,
                                  ));
                            }),
                        SizedBox(
                          height: 80,
                          width: screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: apiProvider.catagoryData.length,
                            itemBuilder: (context, index) {
                              Color color = Color(int.parse(apiProvider
                                  .catagoryData[index]["color"]
                                  .replaceFirst('#', '0xFF')));

                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    CatagoryContainer(
                                      color: color,
                                      img:
                                          "${apiProvider.catagoryData[index]["image"]}",
                                      txt:
                                          "${apiProvider.catagoryData[index]["name"]}",
                                    ),
                                    if (index ==
                                        apiProvider.catagoryData.length - 1)
                                      const SizedBox(
                                        width: 20,
                                      )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customRow(
                            onTap: () {
                              push(context, const ViewAllAuctionProducts());
                            },
                            txt1: "Auction Products",
                            txt2: "View All",
                            txt3: "Hurry up! The auction is ending soon."),
                        const SizedBox(
                          height: 20,
                        ),
                        apiProvider.auctionProductsData.isEmpty
                            ? Center(
                                child: AppText.appText(
                                    "No Auction Product Added Yet"),
                              )
                            : SizedBox(
                                height: 330,
                                width: screenWidth,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      apiProvider.auctionProductsData.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                push(
                                                    context,
                                                    AuctionInfoScreen(
                                                      auction: true,
                                                      productId: apiProvider
                                                              .auctionProductsData[
                                                          index]["id"],
                                                    ));
                                              },
                                              child: AuctionProductContainer(
                                                data: apiProvider
                                                    .auctionProductsData[index],
                                              )),
                                          if (index ==
                                              apiProvider.auctionProductsData
                                                      .length -
                                                  1)
                                            const SizedBox(
                                              width: 20,
                                            )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        customRow(
                            onTap: () {
                              push(context, const ViewFeaturedProducts());
                            },
                            txt1: "Feature Products",
                            txt2: "View All",
                            txt3:
                                "Act fast! These featured products won't last long."),
                        apiProvider.featureProductsData == null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Center(
                                  child: AppText.appText(
                                      "No Feature Product Added Yet"),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: screenWidth / (2.6 * 220),
                                  ),
                                  shrinkWrap: true,
                                  itemCount:
                                      apiProvider.featureProductsData.length,
                                  itemBuilder: (context, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          push(
                                              context,
                                              AuctionInfoScreen(
                                                auction: false,
                                                productId: apiProvider
                                                        .featureProductsData[
                                                    index]["id"],
                                              ));
                                        },
                                        child: FeatureProductContainer(
                                            data: apiProvider
                                                .featureProductsData[index]));
                                  },
                                ),
                              ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow({txt1, txt2, txt3, onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.appText("$txt1",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: AppTheme.textColor),
              GestureDetector(
                onTap: onTap,
                child: AppText.appText("$txt2",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.textColor),
              )
            ],
          ),
          AppText.appText("$txt3",
              fontSize: 10,
              fontWeight: FontWeight.w300,
              textColor: AppTheme.textColor),
        ],
      ),
    );
  }
}
