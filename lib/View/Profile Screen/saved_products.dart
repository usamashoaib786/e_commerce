import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/Utils/widgets/others/divider.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({Key? key}) : super(key: key);

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: const CustomAppBar1(
        title: "Saved items",
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SavedItemListView(
          ischeck: 1,
        ),
      ),
    );
  }
}

class SavedItemListView extends StatefulWidget {
  final int? ischeck;
  const SavedItemListView({super.key, this.ischeck});

  @override
  State<SavedItemListView> createState() => _SavedItemListViewState();
}

class _SavedItemListViewState extends State<SavedItemListView> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "assets/images/auction1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.appText("Modern light clothes",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                textColor: AppTheme.txt1B20),
                            AppText.appText("Dhaka Bangladesh",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textColor: AppTheme.lighttextColor),
                            AppText.appText("34m Ago",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textColor: AppTheme.appColor)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText.appText("Just Now",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: AppTheme.lighttextColor),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const CustomDivider()
          ],
        );
      },
    );
  }
}
