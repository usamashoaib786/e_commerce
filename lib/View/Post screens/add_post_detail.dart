import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/Utils/widgets/others/divider.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';
import 'package:tt_offer/View/Post%20screens/set_price_screen.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  List<String> _selectedCategories = [];
  List<String> _selectedSubCategories = [];
  List<String> _selectedCondition = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("object${_selectedCategories}");
    return Scaffold(
      appBar: CustomAppBar1(
        title: "Detail",
        action: true,
        img: "assets/images/cross.png",
        actionOntap: () {
          pushUntil(context, BottomNavView());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              StepsIndicator(
                conColor1: AppTheme.appColor,
                circleColor1: AppTheme.appColor,
                circleColor2: AppTheme.appColor,
                conColor2: AppTheme.appColor,
              ),
              const SizedBox(
                height: 20,
              ),
              customRow(
                onTap: () {
                  _showCategoryBottomSheet(context);
                },
                title: "Category(required)",
                selectText: _selectedCategories.isNotEmpty
                    ? _selectedCategories.join(", ")
                    : "",
              ),
              customRow(
                onTap: () {
                  _showSubCategoryBottomSheet(context);
                },
                title: "Sub-category(optional)",
                selectText: _selectedSubCategories.isNotEmpty
                    ? _selectedSubCategories.join(", ")
                    : "",
              ),
              customRow(
                onTap: () {
                  _showConditionBottomSheet(context);
                },
                title: "Condition (required)",
                selectText: _selectedCondition.isNotEmpty
                    ? _selectedCondition.join(", ")
                    : "",
              ),
              customRow(
                  onTap: () {},
                  title: "Year, Make & Model (optional)",
                  selectText: ""),
              customRow(
                  onTap: () {}, title: "Mileage (optional)", selectText: ""),
              customRow(
                  onTap: () {}, title: "Color (optional)", selectText: ""),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: AppButton.appButton("Next", onTap: () {
                  push(context, const SetPostPriceScreen());
                },
                    height: 53,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    radius: 32.0,
                    backgroundColor: AppTheme.appColor,
                    textColor: AppTheme.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow({Function()? onTap, title, selectText}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.appText("$title",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      textColor: AppTheme.hintTextColor),
                  Image.asset(
                    "assets/images/arrowDown.png",
                    height: 14,
                    width: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AppText.appText("$selectText",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  textColor: AppTheme.textColor),
              const SizedBox(
                height: 20,
              ),
              const CustomDivider()
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////   category bottom sheet ///////////////////////
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
    ).then((value) {
      setState(() {
        _selectedCategories = _selectedCategories;
      });
    });
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
      return Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            checkColor: AppTheme.whiteColor,
            activeColor: AppTheme.appColor,
            value: _selectedCategories.contains(category),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  _selectedCategories.add(category);
                } else {
                  _selectedCategories.remove(category);
                }
              });
            },
          ),
          AppText.appText(category,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.textColor),
        ],
      );
    }).toList();
  }

  /////////////////////////////   Subcategory bottom sheet ///////////////////////
  void _showSubCategoryBottomSheet(BuildContext context) {
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
                      "Sub Categories",
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
                      children: _buildSubCategoryList(setState),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        _selectedSubCategories = _selectedSubCategories;
      });
    });
  }

  List<Widget> _buildSubCategoryList(StateSetter setState) {
    List<String> subCategories = [
      "Audio & Speakers",
      "Cell Phone & Acessories",
      "Camera & Photography",
      "TV & Media Player",
      "Vedio games & Console",
      "Toys, Games & Hobbies",
      "oomputer & Acesories",
      "Books, Movies & Music"
    ];

    return subCategories.map((subCategory) {
      return Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            checkColor: AppTheme.whiteColor,
            activeColor: AppTheme.appColor,
            value: _selectedSubCategories.contains(subCategory),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  _selectedSubCategories.add(subCategory);
                } else {
                  _selectedSubCategories.remove(subCategory);
                }
              });
            },
          ),
          AppText.appText(subCategory,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.textColor),
        ],
      );
    }).toList();
  }

  /////////////////////////////  Condition bottom sheet ///////////////////////
  void _showConditionBottomSheet(BuildContext context) {
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
                      "Condition",
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
                      children: _buildConditionList(setState),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        _selectedCondition = _selectedCondition;
      });
    });
  }

  List<Widget> _buildConditionList(StateSetter setState) {
    List<String> conditions = [
      "New",
      "Good",
      "Open Box",
      "Refurnished",
      "For Part or Not Working"
    ];

    return conditions.map((condition) {
      return Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            checkColor: AppTheme.whiteColor,
            activeColor: AppTheme.appColor,
            value: _selectedCondition.contains(condition),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  _selectedCondition.add(condition);
                } else {
                  _selectedCondition.remove(condition);
                }
              });
            },
          ),
          AppText.appText(condition,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.textColor),
        ],
      );
    }).toList();
  }
}
