import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class FeatureProductContainer extends StatefulWidget {
  const FeatureProductContainer({super.key});

  @override
  State<FeatureProductContainer> createState() =>
      _FeatureProductContainerState();
}

class _FeatureProductContainerState extends State<FeatureProductContainer> {
  @override
  Widget build(BuildContext context) {
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
    ;
  }
}
