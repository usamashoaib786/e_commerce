import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class AuctionProductContainer extends StatefulWidget {
  final data;
  const AuctionProductContainer({super.key, this.data});

  @override
  State<AuctionProductContainer> createState() =>
      _AuctionProductContainerState();
}

class _AuctionProductContainerState extends State<AuctionProductContainer> {
  DateTime? auctionEndTime;

  @override
  void initState() {
    super.initState();
    // Parse ending date and time strings
    auctionEndTime = _parseEndingDateTime();
  }

  DateTime _parseEndingDateTime() {
    DateTime endingDate =
        DateFormat("yyyy-MM-dd").parse("${widget.data["ending_date"]}");
    DateTime endingTime =
        DateFormat("h:mm a").parse("${widget.data["ending_time"]}");
    // Combine date and time
    return DateTime(
      endingDate.year,
      endingDate.month,
      endingDate.day,
      endingTime.hour,
      endingTime.minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                color: AppTheme.hintTextColor,
                borderRadius: BorderRadius.circular(14),
                image: widget.data["photo"].isNotEmpty
                    ? DecorationImage(
                        image:
                            NetworkImage("${widget.data["photo"][0]["src"]}"),
                        fit: BoxFit.fill)
                    : null),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 10.0),
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
          AppText.appText("${widget.data["title"]}",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.textColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.appText("\$${widget.data["auction_price"]}",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  textColor: AppTheme.textColor),
              AppText.appText("${widget.data["auction"].length} Bid Now",
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
              SizedBox(width: 80,
                child: AppText.appText(getTimeLeftString(),
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    textColor: AppTheme.appColor),
              ),
            ],
          ),
          AppButton.appButton("Bid Now",
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
  }

  String getTimeLeftString() {
    Duration timeLeft = auctionEndTime!.difference(DateTime.now());
    int days = timeLeft.inDays;
    int hours = timeLeft.inHours % 24;
    return '$days Days $hours Hours';
  }
}
