import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_offer/Constants/app_logger.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/Utils/utils.dart';
import 'package:tt_offer/Utils/widgets/loading_popup.dart';
import 'package:tt_offer/Utils/widgets/others/app_button.dart';
import 'package:tt_offer/Utils/widgets/others/app_text.dart';
import 'package:tt_offer/Utils/widgets/others/custom_app_bar.dart';
import 'package:tt_offer/Utils/widgets/textField_lable.dart';
import 'package:tt_offer/View/BottomNavigation/navigation_bar.dart';
import 'package:tt_offer/View/Post%20screens/add_post_detail.dart';
import 'package:tt_offer/View/Post%20screens/indicator.dart';
import 'package:tt_offer/config/app_urls.dart';
import 'package:tt_offer/config/dio/app_dio.dart';
import 'package:tt_offer/config/keys/pref_keys.dart';
import 'package:image/image.dart' as img;

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  List<String> imagePaths = [];
  final PageController _controller = PageController();
  int _currentPage = 0;
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
      await _compressAndAddImage(pickedFile.path);
    }
  }

  Future<void> _getImagesFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        await _compressAndAddImage(pickedFile.path);
      }
    }
  }

  Future<void> _compressAndAddImage(String imagePath) async {
    // Load the image
    img.Image? image = img.decodeImage(File(imagePath).readAsBytesSync());

    img.Image compressedImage =
        img.copyResize(image!, width: 800); // Resize image
    List<int> compressedImageData = img.encodeJpg(compressedImage,
        quality: 85); // Compress with quality 85%

    String compressedImagePath =
        await _saveCompressedImage(compressedImageData);

    setState(() {
      imagePaths.add(compressedImagePath);
    });
  }

  Future<String> _saveCompressedImage(List<int> imageData) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = await new File(
            '${tempDir.path}/compressed_image_${DateTime.now().millisecondsSinceEpoch}.jpg')
        .create();

    await tempFile.writeAsBytes(imageData);

    return tempFile.path;
  }

  Future<void> _getVediosFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFiles != null) {
      // Check file size before compression
      File videoFile = File(pickedFiles.path);
      int fileSizeInBytes = await videoFile.length();
      int fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);

      if (fileSizeInMB > 5) {
        showSnackBar(context, "Selected video file size exceeds 2 MB.");
        return;
      }

      setState(() {
        vedioPath = pickedFiles.path;
      });

      // await _compressVideo(vedioPath);
    }
  }

  // Future<void> _compressVideo(String videoPath) async {
  //   final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
  //   Directory tempDir = await getTemporaryDirectory();
  //   String outputFileName =
  //       'compressed_video_${DateTime.now().millisecondsSinceEpoch}.mp4'; // Unique output file name
  //   String outputFilePath =
  //       '${tempDir.path}/$outputFileName'; // Output file path in the temporary directory

  //   // Compression command
  //   String command =
  //       '-i $videoPath -b:v 500K $outputFilePath'; // Set video bitrate to 1M (1 megabit per second)

  //   // Run FFmpeg command
  //   int returnCode = await _flutterFFmpeg.execute(command);

  //   if (returnCode == 0) {
  //     print(
  //         'Video compression successful. Compressed video saved at: $outputFilePath');
  //     setState(() {
  //       vedioPath = outputFilePath;
  //     });
  //   } else {
  //     print('Video compression failed.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("ocameraPaths: ${imagePaths}");

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
              imagePaths.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 250,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: imagePaths.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(imagePaths[index]),
                                          ),
                                          fit: BoxFit.fill)),
                                );
                              },
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          DotsIndicator(
                            dotsCount: imagePaths.length,
                            position: _currentPage,
                            decorator: DotsDecorator(
                              color: AppTheme.lighttextColor,
                              activeColor:
                                  AppTheme.appColor, // Active dot color
                              size: const Size.square(9.0), // Dot size
                              activeSize: const Size(18.0, 9.0),
                              spacing: const EdgeInsets.all(
                                  5.0), // Spacing between dots
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5.0), // Active dot shape
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
              AppText.appText("Add your cover photo first",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppTheme.textColor),
              LableTextField(
                labelTxt: "Title",
                hintTxt: "Title",
                controller: _titleController,
              ),
              LableTextField(
                labelTxt: "Description",
                hintTxt: "Description",
                controller: _descController,
                maxLines: 3,
                height: 100.0,
              ),
              _isLoading == true
                  ? LoadingDialog()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: AppButton.appButton("Next", onTap: () {
                        // push(context, const PostDetailScreen());

                        if (imagePaths.isNotEmpty) {
                          if (_titleController.text.isNotEmpty) {
                            if (_descController.text.isNotEmpty) {
                              if (_descController.text.length > 100) {
                                addProductFirstStep();
                              } else {
                                showSnackBar(context,
                                    "Description must be alteast 100 characters");
                              }
                            } else {
                              showSnackBar(context, "Enter Description");
                            }
                          } else {
                            showSnackBar(context, "Enter title");
                          }
                        } else {
                          showSnackBar(context, "Add atleast one image");
                        }
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
    int responseCode500 = 500;
    int responseCode413 = 413; // For For data not found

    File videoFile = File(vedioPath);
    int fileSize = await videoFile.length();
    print("Length ${fileSize}");
    var formData = FormData();
    formData.fields.addAll([
      MapEntry("user_id", "$userId"),
      MapEntry("title", _titleController.text),
      MapEntry("description", _descController.text),
    ]);
    if (vedioPath.isNotEmpty) {
      formData.files
          .add(MapEntry("video", await MultipartFile.fromFile(videoFile.path)));
    }
    try {
      response = await dio.post(path: AppUrls.addProduct, data: formData);
      var responseData = response.data;
      print("object${responseData}");
      if (response.statusCode == responseCode400) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode401) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode413) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode404) {
        showSnackBar(context, "${responseData["msg"]}");
        setState(() {
          _isLoading = false;
        });
      } else if (response.statusCode == responseCode500) {
        showSnackBar(context, "${responseData["msg"]}");
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
            var productId = responseData["product_id"];
            sendImages(productId: "$productId");
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

  void sendImages({productId}) async {
    print("objectId $productId");
    setState(() {
      _isLoading = true;
    });
    var response;
    int responseCode200 = 200; // For successful request.
    int responseCode400 = 400; // For Bad Request.
    int responseCode401 = 401; // For Unauthorized access.
    int responseCode404 = 404; // For For data not found
    int responseCode422 = 422; // For For data not found
    int responseCode413 = 413; // For For data not found
    int responseCode500 = 500; // Internal server error.
    List<MultipartFile> imageFiles = [];

    for (var i = 0; i < imagePaths.length; i++) {
      File file = File(imagePaths[i]);
      imageFiles.add(await MultipartFile.fromFile(file.path));
    }
    var formData = FormData.fromMap({
      "product_id": productId,
      "src": imageFiles,
    });

    try {
      response = await dio.post(path: AppUrls.addImage, data: formData);
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
      } else if (response.statusCode == responseCode413) {
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
            imagePaths.clear();
            _descController.clear();
            _titleController.clear();
            vedioPath = "";
            _isLoading = false;

            push(
                context,
                PostDetailScreen(
                  productId: productId,
                ));
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
