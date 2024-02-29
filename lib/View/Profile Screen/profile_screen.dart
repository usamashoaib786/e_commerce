import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: AppText.appText("Profile",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.blackColor),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/logout.png",
                  height: 20,
                  width: 20,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              upperContainer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  verifiedContainer(
                      txt: "Email Verified", img: "assets/images/sms.png"),
                  verifiedContainer(
                      txt: "Image Verified", img: "assets/images/gallery.png"),
                  verifiedContainer(
                      txt: "Phone Verified", img: "assets/images/call.png"),
                  verifiedContainer(
                      txt: "Join TruYou", img: "assets/images/verify1.png"),
                ],
              ),
              headingText(txt: "Transactions"),
              customRow(
                  onTap: () {},
                  txt: "Purchases & Sales",
                  img: "assets/images/receipt.png"),
              customRow(
                  onTap: () {},
                  txt: "Payment & Deposit method",
                  img: "assets/images/payment.png"),
              divider(),
              headingText(txt: "Save"),
              customRow(
                  onTap: () {},
                  txt: "Saved items",
                  img: "assets/images/heart.png"),
              customRow(
                  onTap: () {},
                  txt: "Search alerts",
                  img: "assets/images/notification.png"),
              divider(),
              headingText(txt: "Account"),
              customRow(
                  onTap: () {},
                  txt: "Account Setting",
                  img: "assets/images/accountSetting.png"),
              customRow(
                  onTap: () {},
                  txt: "Boost Plus",
                  img: "assets/images/boostPlus.png"),
              customRow(
                  onTap: () {},
                  txt: "Custom Profile Link",
                  img: "assets/images/link.png"),
              divider(),
              headingText(txt: "Help"),
              customRow(
                  onTap: () {},
                  txt: "Help Center",
                  img: "assets/images/helpCenter.png"),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  Widget verifiedContainer({img, txt, color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: 80,
        width: 47,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: color ?? AppTheme.appColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "$img",
                  height: 20,
                  color: AppTheme.whiteColor,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              child: AppText.appText("$txt",
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: AppTheme.txt1B20),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffEAEAEA),
        ));
  }

  Widget headingText({txt}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: AppText.appText("$txt",
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textColor: AppTheme.txt1B20),
    );
  }

  Widget customRow({img, txt, required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "$img",
                  height: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                AppText.appText("$txt",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.txt1B20),
              ],
            ),
            Image.asset(
              "assets/images/arrowFor.png",
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget upperContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 160,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 92,
                  width: 80,
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppTheme.text09,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset("assets/images/camera.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AppText.appText("Darlene Robertson",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppTheme.txt1B20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarRating(
                      rating: 2.5 ?? 0,
                      color: Colors.yellow,
                      size: 14,
                    ),
                    AppText.appText("5.0",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        textColor: AppTheme.txt1B20),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.appText("0 Follower",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppTheme.txt1B20),
                    AppText.appText("0 Following",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppTheme.txt1B20),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  StarRating({required this.rating, this.size = 30, required this.color});

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.floor();
    bool hasHalfStar = rating - filledStars >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < filledStars) {
          return Icon(
            Icons.star,
            color: color ?? Colors.yellow,
            size: size,
          );
        } else if (index == filledStars && hasHalfStar) {
          return Icon(
            Icons.star_half,
            color: color ?? Colors.yellow,
            size: size,
          );
        } else {
          return Icon(
            Icons.star_border,
            color: color ?? Colors.grey,
            size: size,
          );
        }
      }),
    );
  }
}
