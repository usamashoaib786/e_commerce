import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/ChatScreens/provider_class.dart';

class OfferChatScreen extends StatefulWidget {
  const OfferChatScreen({super.key});

  @override
  State<OfferChatScreen> createState() => _OfferChatScreenState();
}

class _OfferChatScreenState extends State<OfferChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _priceController = TextEditingController();
  @override
  void initState() {
    _priceController.text = "\$ 60";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final open = Provider.of<NotifyProvider>(context);

    return Scaffold(
      appBar: const ChatAppBar(),
      body: GestureDetector(
        onTap: () {
          // Unfocus the text field when tapping anywhere else on the page
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: open.isCustom == false ? 200 : 360,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Container(
                          height: open.isCustom == false ? 170 : 330,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xffF3F4F5),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppText.appText("Sent you a offer",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    textColor: const Color(0xff2A2A2F)),
                                AppText.appText("\$ 500",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    textColor: const Color(0xff2A2A2F)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      offerButtons(
                                          onTap: () {}, txt: "Reject Offer"),
                                      offerButtons(
                                          onTap: () {}, txt: "Accept Offer"),
                                      offerButtons(
                                          onTap: () {
                                            open.openclose();
                                          },
                                          txt: "Custom Offer"),
                                    ],
                                  ),
                                ),
                                open.isCustom == false
                                    ? const SizedBox.shrink()
                                    : Column(
                                        children: [
                                          AppText.appText("Enter Your Offer",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              textColor: AppTheme.textColor),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomAppFormField(
                                            texthint: "",
                                            controller: _priceController,
                                            width: 161,
                                            textAlign: TextAlign.center,
                                            fontsize: 24,
                                            fontweight: FontWeight.w600,
                                            cPadding: 2.0,
                                            type: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                open.isCustom == false
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: AppButton.appButton("Send Offer",
                                            onTap: () {
                                          push(
                                              context, const OfferChatScreen());
                                        },
                                            height: 50,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            radius: 32.0,
                                            backgroundColor: AppTheme.appColor,
                                            textColor: AppTheme.whiteColor),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/auction1.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return _buildMessageBubble(
                        user: true,
                        message: "",
                        img: "",
                      );
                    },
                  ),
                ),
                _buildUserInput(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget offerButtons({Function()? onTap, txt}) {
    return AppButton.appButton("$txt",
        onTap: onTap,
        height: 29,
        width: MediaQuery.of(context).size.width * 0.25,
        fontWeight: FontWeight.w500,
        fontSize: 8,
        radius: 16.0,
        backgroundColor: AppTheme.appColor,
        textColor: AppTheme.whiteColor);
  }

  Widget _buildMessageBubble({user, message, img}) {
    return Column(
      children: [
        Container(
            alignment: user ? Alignment.centerRight : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 250, minWidth: 80),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: user
                    ? const Color.fromARGB(255, 196, 167, 212)
                    : const Color(0xffEAEAEA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$message",
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: const Color(0xffECECEC),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                autofocus: false,
                controller: _textEditingController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type here ...',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // final userMessage = _textEditingController.text;
                // if (userMessage.isNotEmpty || _pickedFilePath != null) {
                //   sendMessage(message: _textEditingController.text);
                //   _textEditingController.clear();
                //   _pickedFilePath = null;
                // }
              },
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/images/gallery.png",
                    fit: BoxFit.fill,
                    color: const Color(0xff8E97A4),
                  )),
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/images/send.png",
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
