import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/Utils/widgets/others/divider.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/enter_location_screen.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';

class SetPostPriceScreen extends StatefulWidget {
  const SetPostPriceScreen({super.key});

  @override
  State<SetPostPriceScreen> createState() => _SetPostPriceScreenState();
}

class _SetPostPriceScreenState extends State<SetPostPriceScreen> {
  String selectedOption = 'Fixed Price';
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _startingPriceController =
      TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  var startTime;
  var endTime;
  @override
  void initState() {
    _priceController.text = "\$ 60";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton.appButton("Next", onTap: () {
          push(context, const PostLocationScreen());
        },
            height: 53,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            radius: 32.0,
            backgroundColor: AppTheme.appColor,
            textColor: AppTheme.whiteColor),
      ),
      appBar: CustomAppBar1(
        title: "Price",
        action: true,
        img: "assets/images/cross.png",
        actionOntap: () {
          pushUntil(context, const BottomNavView());
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
                conColor3: AppTheme.appColor,
                circleColor3: AppTheme.appColor,
              ),
              const SizedBox(
                height: 20,
              ),
              selectOption(),
              if (selectedOption == "Fixed Price") fixedColumn(),
              if (selectedOption == "Auction") auctionColumn(),
              if (selectedOption == "Sell to Ux") uXColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectOption() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          double tapPosition = details.localPosition.dx;
          if (tapPosition < screenWidth * 0.3) {
            setState(() {
              selectedOption = 'Fixed Price';
            });
          } else if (tapPosition < screenWidth * 0.6) {
            setState(() {
              selectedOption = 'Auction';
            });
          } else {
            setState(() {
              selectedOption = 'Sell to Ux';
            });
          }
        },
        child: Container(
          height: 38,
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xffEDEDED))),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(100)),
                    color: selectedOption == 'Fixed Price'
                        ? AppTheme.appColor // Change color when selected
                        : Colors.transparent,
                  ),
                  child: Text(
                    'Fixed Price',
                    style: TextStyle(
                      color: selectedOption == 'Fixed Price'
                          ? Colors.white // Change text color when selected
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    color: selectedOption == 'Auction'
                        ? AppTheme.appColor // Change color when selected
                        : Colors.transparent,
                  ),
                  child: Text(
                    'Auction',
                    style: TextStyle(
                      color: selectedOption == 'Auction'
                          ? Colors.white // Change text color when selected
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(100)),
                    color: selectedOption == 'Sell to Ux'
                        ? AppTheme.appColor // Change color when selected
                        : Colors.transparent,
                  ),
                  child: Text(
                    'Sell to Ux',
                    style: TextStyle(
                      color: selectedOption == 'Sell to Ux'
                          ? Colors.white // Change text color when selected
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fixedColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          AppText.appText("Enter Your Price",
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
          const SizedBox(
            height: 40,
          ),
          const CustomDivider(),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              AppText.appText("Firm on price",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.txt1B20),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomDivider()
        ],
      ),
    );
  }

  Widget auctionColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.appText("Starting Price",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          const SizedBox(
            height: 10,
          ),
          CustomAppFormField(
            width: MediaQuery.of(context).size.width,
            texthint: "Starting Price",
            controller: _startingPriceController,
            borderColor: AppTheme.borderColor,
            hintTextColor: AppTheme.hintTextColor,
          ),
          const SizedBox(
            height: 15,
          ),
          AppText.appText("Time",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dateContainer(
                  onTap: () {
                    _selectTime(context);
                  },
                  headText: "Starting Time",
                  nullText: "Start TIme",
                  dateCheck: startTime,
                  date: false),
              dateContainer(
                  onTap: () {
                    _selectTimeTwo(context);
                  },
                  headText: "Ending Time",
                  nullText: "End Time",
                  dateCheck: endTime,
                  date: false)
            ],
          ),
          AppText.appText("Date",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dateContainer(
                  onTap: () {
                    _selectDate(context);
                  },
                  headText: "Starting Date",
                  nullText: "Start Date",
                  dateCheck: startDate,
                  date: true),
              dateContainer(
                  onTap: () {
                    _selectDate1(context);
                  },
                  headText: "Ending Date",
                  nullText: "End Date",
                  dateCheck: endDate,
                  date: true)
            ],
          )
        ],
      ),
    );
  }

  Widget dateContainer({
    onTap,
    headText,
    nullText,
    dateCheck,
    date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.appText("$headText",
              fontSize: 10,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.borderColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      date == true
                          ? AppText.appText(
                              dateCheck == null
                                  ? "$nullText"
                                  : DateFormat('MM-dd-yyyy').format(dateCheck!),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              textColor: dateCheck == null
                                  ? AppTheme.hintTextColor
                                  : AppTheme.hintTextColor)
                          : AppText.appText(
                              dateCheck == null ? "$nullText" : dateCheck,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              textColor: dateCheck == null
                                  ? AppTheme.hintTextColor
                                  : AppTheme.hintTextColor),
                      Image.asset(
                        date == true
                            ? "assets/images/calender.png"
                            : "assets/images/clock.png",
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.white, // Change the primary color
              colorScheme: ColorScheme.light(
                  primary: AppTheme.appColor), // Change overall color scheme
              buttonTheme: ButtonThemeData(buttonColor: AppTheme.appColor),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.white, // Change the primary color
              colorScheme: ColorScheme.light(
                  primary: AppTheme.appColor), // Change overall color scheme
              buttonTheme: ButtonThemeData(buttonColor: AppTheme.appColor),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.white, // Change the primary color
              colorScheme: ColorScheme.light(
                  primary: AppTheme.appColor), // Change overall color scheme
              buttonTheme: ButtonThemeData(buttonColor: AppTheme.appColor),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        startTime = picked.format(context);
      });
    }
  }

  Future<void> _selectTimeTwo(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.white, // Change the primary color
              colorScheme: ColorScheme.light(
                  primary: AppTheme.appColor), // Change overall color scheme
              buttonTheme: ButtonThemeData(buttonColor: AppTheme.appColor),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        endTime = picked.format(context);
      });
    }
  }

  Widget uXColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: AppText.appText(
              "Kindly schedule a convenient date for a meeting with our specialist to assess your items.",
              textColor: AppTheme.hintTextColor,
              fontSize: 10,
              fontWeight: FontWeight.w400),
        ),
        Image.asset(
          "assets/images/calender.png",
          height: 18,
        ),
      ],
    );
  }
}
