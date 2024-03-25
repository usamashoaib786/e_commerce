import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_offer/Constants/app_logger.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_field.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/add_post_detail.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';
import 'package:tt_offer/config/app_urls.dart';
import 'package:tt_offer/config/dio/app_dio.dart';
import 'package:tt_offer/config/keys/pref_keys.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  List<String> imagePaths = [];
  var vedioPath = "";
  bool _isLoading = false;
  late AppDio dio;
  AppLogger logger = AppLogger();
  var userId;
  @override
  void initState() {
    dio = AppDio(context);
    logger.init();
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString(PrefKey.userId);
    });
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagePaths.add(pickedFile.path);
      });
    }
  }

  Future<void> _getImagesFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      setState(() {
        for (var pickedFile in pickedFiles) {
          imagePaths.add(pickedFile.path);
        }
      });
    }
  }

  Future<void> _getVediosFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFiles != null) {
      setState(() {
        vedioPath = pickedFiles.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ocameraPaths: ${imagePaths.length}");

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: CustomAppBar1(
        title: "Post an Item",
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButtonWithLeadingImage("Take Photo",
                    onTap: () {
                  _takePicture();
                },
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.textColor,
                    imagePath: "assets/images/camera.png",
                    imgHeight: 20,
                    height: 48,
                    space: 20.0),
              ),
              AppButton.appButtonWithLeadingImage("Select Image", onTap: () {
                _getImagesFromGallery();
              },
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor,
                  imagePath: "assets/images/gallery1.png",
                  imgHeight: 20,
                  height: 48,
                  space: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButtonWithLeadingImage("Select Vedio",
                    onTap: () {
                  _getVediosFromGallery();
                },
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppTheme.textColor,
                    imagePath: "assets/images/video.png",
                    imgHeight: 20,
                    height: 48,
                    space: 20.0),
              ),
              AppText.appText("Add your cover photo first",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor),
              customColumn(
                  txt: "Title", hintTxt: "Title", controller: _titleController),
              customColumn(
                  txt: "Description (Optional)",
                  hintTxt: "Description",
                  controller: _descController,
                  maxline: 3,
                  height: 100.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: AppButton.appButton("Next", onTap: () {
                  push(context, const PostDetailScreen());
                  // if (imagePaths.isNotEmpty) {
                  //   if (_titleController.text.isNotEmpty) {
                  //     if (_descController.text.isNotEmpty) {
                  //       if (_descController.text.length > 100) {
                  //         addProductFirstStep();
                  //       } else {
                  //         showSnackBar(context,
                  //             "Description must be alteast 100 characters");
                  //       }
                  //     } else {
                  //       showSnackBar(context, "Enter Description");
                  //     }
                  //   } else {
                  //     showSnackBar(context, "Enter title");
                  //   }
                  // } else {
                  //   showSnackBar(context, "Upload at least one image");
                  // }
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

  Widget customColumn({txt, hintTxt, controller, width, maxline, height}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.appText("$txt",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: AppTheme.text09),
          const SizedBox(
            height: 10,
          ),
          CustomAppFormField(
            maxline: maxline,
            height: height,
            width: MediaQuery.of(context).size.width,
            texthint: "$hintTxt",
            controller: controller,
            borderColor: AppTheme.borderColor,
            hintTextColor: AppTheme.hintTextColor,
          )
        ],
      ),
    );
  }

  void addProductFirstStep() async {
    setState(() {
      _isLoading = true;
    });
    var response;
    int responseCode200 = 200; // For successful request.
    int responseCode400 = 400; // For Bad Request.
    int responseCode401 = 401; // For Unauthorized access.
    int responseCode404 = 404; // For For data not found
    int responseCode422 = 422; // For For data not found
    int responseCode500 = 500; // Internal server error.
    var formData = FormData();
    formData.fields.addAll([
      MapEntry("user_id", "$userId"),
      MapEntry("title", _titleController.text),
      MapEntry("description", _descController.text),
    ]);

// Append all images under a single key
    for (int i = 0; i < imagePaths.length; i++) {
      formData.files.add(MapEntry(
        "images[$i]",
        await MultipartFile.fromFile(
          imagePaths[i],
          filename: imagePaths[i].split('/').last,
        ),
      ));
    }

// Optionally, append video if needed
    if (vedioPath.isNotEmpty) {
      formData.files.add(MapEntry(
        "video",
        await MultipartFile.fromFile(
          vedioPath,
          filename: vedioPath.split('/').last,
        ),
      ));
    }
    try {
      response = await dio.post(path: AppUrls.addProduct, data: formData);
      var responseData = response.data;
      print("object${responseData}");
      if (response.statusCode == responseCode400) {
        showSnackBar(context, "${responseData["message"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode401) {
        showSnackBar(context, "${responseData["message"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode404) {
        showSnackBar(context, "${responseData["message"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode500) {
        showSnackBar(context, "${responseData["message"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode422) {
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode200) {
        if (responseData["status"] == false) {
          setState(() {
            _isLoading = false;
          });

          return;
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Something went Wrong ${e}");
      showSnackBar(context, "Something went Wrong.");
      setState(() {
        _isLoading = false;
      });
    }
  }
}
