import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight = 50.0;
  final context;
  final title;
  final action;
  final actionOntap;

  // Callback function

  const CustomAppBar1(
      {super.key, this.context, this.title, this.action, this.actionOntap});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/images/arrow-left.png",
              height: 24,
              width: 24,
            ),
          )),
      title: AppText.appText("$title",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          textColor: const Color(0xff1B2028)),
      centerTitle: true,
      actions: [
        action == true
            ? Padding(
              padding: const EdgeInsets.only(right:10),
              child: GestureDetector(
                  onTap: actionOntap,
                  child: Image.asset(
                    "assets/images/more.png",
                    height: 24,
                    width: 24,
                  ),
                ),
            )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
