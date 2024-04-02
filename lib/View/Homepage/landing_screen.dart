import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_offer/Constants/app_logger.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/loading_popup.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/View/All%20Aucton%20Products/all_auction_procucts.dart';
import 'package:tt_offer/View/All%20Categories/all_caetgories.dart';
import 'package:tt_offer/View/All%20Categories/catagory_container.dart';
import 'package:tt_offer/View/All%20Featured%20Products/all_feature_products.dart';
import 'package:tt_offer/View/All%20Featured%20Products/feature_container.dart';
import 'package:tt_offer/View/Auction%20Info/auction_info.dart';
import 'package:tt_offer/View/Homepage/home_app_bar.dart';
import 'package:tt_offer/config/app_urls.dart';
import 'package:tt_offer/config/dio/app_dio.dart';
import 'package:tt_offer/config/keys/pref_keys.dart';

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

  bool _isLoading = false;
  late AppDio dio;
  AppLogger logger = AppLogger();
  var catagoryData;
  var auctionProductsData;
  String? id;
  var featureProductsData;
  @override
  void initState() {
    dio = AppDio(context);
    logger.init();
    getUserCredentials();
    getCatagories();
    super.initState();
  }

  void getUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString(PrefKey.userId);
      getAuctionProducts(userId: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              _isLoading == true
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
                              // Display dots indicators
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
                                    data: catagoryData,
                                  ));
                            }),
                        SizedBox(
                          height: 80,
                          width: screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              Color color = Color(int.parse(catagoryData[index]
                                      ["color"]
                                  .replaceFirst('#', '0xFF')));

                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    CatagoryContainer(
                                      color: color,
                                      img: "${catagoryData[index]["image"]}",
                                      txt: "${catagoryData[index]["name"]}",
                                    ),
                                    if (index == 5 - 1)
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
                        SizedBox(
                          height: 330,
                          width: screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        push(
                                            context,
                                            const AuctionInfoScreen(
                                              auction: true,
                                            ));
                                      },
                                      child: SizedBox(
                                        height: 325,
                                        width: 161,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 210,
                                              width: 161,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/auction1.png"))),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppTheme
                                                            .whiteColor),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      size: 13,
                                                      color: AppTheme.textColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AppText.appText(
                                                "Modern light clothes",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppTheme.textColor),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppText.appText("\$212.99",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    textColor:
                                                        AppTheme.textColor),
                                                AppText.appText("1 Bid Now",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200,
                                                    textColor:
                                                        AppTheme.textColor),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppText.appText("Time Left:",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    textColor:
                                                        AppTheme.textColor),
                                                AppText.appText("1 Day 5 Hours",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    textColor:
                                                        AppTheme.appColor),
                                              ],
                                            ),
                                            AppButton.appButton("Bid Now",
                                                onTap: () {},
                                                height: 32,
                                                width: 161,
                                                radius: 16.0,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                backgroundColor:
                                                    AppTheme.appColor,
                                                textColor: AppTheme.whiteColor)
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (index == 4 - 1)
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
                        Padding(
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
                            itemCount: 4,
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

/////////////////////////////////// Apis///////////////////////////////////////////////
  void getCatagories() async {
    setState(() {
      _isLoading = true;
    });
    var response;
    int responseCode200 = 200; // For successful request.
    int responseCode400 = 400; // For Bad Request.
    int responseCode401 = 401; // For Unauthorized access.
    int responseCode404 = 404; // For For data not found
    int responseCode422 = 422; // For For data not found
    int responseCode500 = 500; // Internal server error.
    Map<String, dynamic> params = {
      "search": "",
      "limit": null,
    };
    try {
      response = await dio.post(path: AppUrls.categories, data: params);
      var responseData = response.data;
      if (response.statusCode == responseCode400) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode401) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode404) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode500) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode422) {
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode200) {
        setState(() {
          catagoryData = responseData;
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Something went Wrong ${e}");
      showSnackBar(context, "Something went Wrong.");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void getAuctionProducts({userId}) async {
    setState(() {
      _isLoading = true;
    });
    var response;
    int responseCode200 = 200; // For successful request.
    int responseCode400 = 400; // For Bad Request.
    int responseCode401 = 401; // For Unauthorized access.
    int responseCode404 = 404; // For For data not found
    int responseCode422 = 422; // For For data not found
    int responseCode500 = 500; // Internal server error.
    Map<String, dynamic> params = {
      "id": userId,
      "search": "",
      "category_id": null,
      "sub_category_id": null,
      "limit": null,
      "location": null,
    };
    try {
      response = await dio.post(path: AppUrls.getAuctionProducts, data: params);
      var responseData = response.data;
      if (response.statusCode == responseCode400) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode401) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode404) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode500) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode422) {
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode200) {
        setState(() {
          auctionProductsData = responseData;
          getFeatureProducts(userId: userId);

          _isLoading = false;
        });
      }
    } catch (e) {
      print("Something went Wrong ${e}");
      showSnackBar(context, "Something went Wrong.");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void getFeatureProducts({userId}) async {
    setState(() {
      _isLoading = true;
    });
    var response;
    int responseCode200 = 200; // For successful request.
    int responseCode400 = 400; // For Bad Request.
    int responseCode401 = 401; // For Unauthorized access.
    int responseCode404 = 404; // For For data not found
    int responseCode422 = 422; // For For data not found
    int responseCode500 = 500; // Internal server error.
    Map<String, dynamic> params = {
      "id": userId,
      "search": "",
      "category_id": null,
      "sub_category_id": null,
      "limit": null,
      "location": null,
    };
    try {
      response = await dio.post(path: AppUrls.getFeatureProducts, data: params);
      var responseData = response.data;
      if (response.statusCode == responseCode400) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode401) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode404) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode500) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode422) {
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode200) {
        setState(() {
          featureProductsData = responseData;
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Something went Wrong ${e}");
      showSnackBar(context, "Something went Wrong.");
      setState(() {
        _isLoading = false;
      });
    }
  }
}
