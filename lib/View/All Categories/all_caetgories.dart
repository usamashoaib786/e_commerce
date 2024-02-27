import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  static const List<String> categoryTxt = [
    "Car",
    "Bike",
    "Drink",
    "Home",
    "Real Estate",
    "Watches",
    "Jewellry",
    "Smart Phone",
    "Pets",
    "shoes",
    "Furniture",
    "laptop",
    "Toys",
    "Cloths"
  ];
  List categoryImg = [
    "assets/images/car.png",
    "assets/images/bike.png",
    "assets/images/drink.png",
    "assets/images/homeCate.png",
    "assets/images/estate.png",
    "assets/images/watch.png",
    "assets/images/jewellry.png",
    "assets/images/phone.png",
    "assets/images/pet.png",
    "assets/images/shoe.png",
    "assets/images/furniture.png",
    "assets/images/laptop.png",
    "assets/images/toy.png",
    "assets/images/cloth.png",
  ];
  final List<Color> categoryColor = [
    const Color(0xffFFEBFD),
    const Color(0xffFFF7EB),
    const Color(0xffEBF9FF),
    const Color(0xffECFFEB),
    const Color(0xffFFEBEB),
    const Color(0xffFDFFEB),
    const Color(0xffEBF0FF),
    const Color(0xffEBFFFC),
    const Color(0xffF8EBFF),
    const Color(0xffEBFFF6),
    const Color(0xffF5FFEB),
    const Color(0xffEBF9FF),
    const Color(0xffFFF7EB),
    const Color(0xffFFEBFD),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        title: "Categories",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: categoryImg.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30,
            crossAxisSpacing: 20,
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return Container(
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
            );
          },
        ),
      ),
    );
  }
}
