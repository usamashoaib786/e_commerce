import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  TextEditingController _searchController = TextEditingController();
  static const List<String> _imagePaths = [
    "assets/images/sliderImg.png",
    "assets/images/sliderImg.png",
    "assets/images/sliderImg.png",
  ];

  static const List<String> categoryTxt = ["Car", "Bike", "Drink", "Home"];
  List categoryImg = [
    "assets/images/car.png",
    "assets/images/bike.png",
    "assets/images/drink.png",
    "assets/images/homeCate.png",
  ];
  final List<Color> categoryColor = [
    const Color(0xffFFEBFD),
    const Color(0xffFFF7EB),
    const Color(0xffEBF9FF),
    const Color(0xffECFFEB),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomAppFormField(
                  height: 48,
                  radius: 15.0,
                  prefixIcon: Image.asset(
                    "assets/images/search.png",
                    height: 20,
                    width: 20,
                    color: AppTheme.textColor,
                  ),
                  texthint: "Search",
                  controller: _searchController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              customRow(txt1: "Categories", txt2: "View All", txt3: ""),
              SizedBox(
                height: 80,
                width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryTxt.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            height: 77,
                            width: 77,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: categoryColor[index]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "${categoryImg[index]}",
                                  height: 32,
                                  width: 32,
                                ),
                                AppText.appText("${categoryTxt[index]}",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppTheme.textColor),
                              ],
                            ),
                          ),
                          if (index == categoryColor.length - 1)
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
                  itemCount: categoryTxt.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 325,
                            width: 161,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 210,
                                  width: 161,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/auction1.png"))),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                          ),
                          if (index == categoryColor.length - 1)
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
                  txt1: "Feature Products",
                  txt2: "View All",
                  txt3: "Act fast! These featured products won't last long."),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    featureContainer(),
                    const SizedBox(
                      width: 20,
                    ),
                    featureContainer()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    featureContainer(),
                    const SizedBox(
                      width: 20,
                    ),
                    featureContainer()
                  ],
                ),
              ),
                const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow({txt1, txt2, txt3}) {
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
              AppText.appText("$txt2",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor)
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

  Widget featureContainer({color, img, txt}) {
    return Container(
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
                    image: AssetImage("assets/images/auction1.png"),
                    fit: BoxFit.fitWidth)),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppTheme.whiteColor),
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
                  Icon(Icons.star, color: Colors.amber,size: 18,),
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
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight = 70.0;
  // Callback function

  const CustomAppBar();
  @override
  Widget build(BuildContext contex7t) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 40, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo1.png",
            height: 40,
            width: 120,
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: AppTheme.textColor,
                  size: 20,
                ),
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
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
