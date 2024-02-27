import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight = 50.0;
  final context;
  final title;
  // Callback function

  const CustomAppBar1({this.context, this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Color(0xff292D32),
          )),
      title: AppText.appText("$title",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          textColor: const Color(0xff1B2028)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
