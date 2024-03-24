import 'dart:io';
import 'dart:convert';
import 'package:TeaHub/disease_description_treatment/product_screen.dart';
import 'package:http/http.dart' as http;

import 'package:TeaHub/disease_description_treatment/home_screen.dart';
import 'package:TeaHub/disease_description_treatment/welcome_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:TeaHub/home_page/constants.dart';
import 'package:TeaHub/snap_tips/SnapTips.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _bottomNavIndex = 0;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: FaIcon(
                      FontAwesomeIcons.times,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.syncAlt,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageFile == null
                        ? Image.asset(
                            'assets/images/qr-code-scan.png',
                            height: 500.0,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              imageFile!,
                              height: 500.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(.80),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //----- Code - 1 ------//

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showImagePicker(context);
      //   },
      //   backgroundColor: Constants.primaryColor,
      //   child: const FaIcon(
      //     FontAwesomeIcons.camera,
      //     color: Colors.white,
      //   ),
      // ),
      floatingActionButton: ClipRRect(
        borderRadius:
            BorderRadius.circular(30.0), // Adjust the value to your preference
        child: FloatingActionButton(
          onPressed: () {
            _showImagePicker(context);
          },
          backgroundColor: Constants.primaryColor,
          child: const FaIcon(
            FontAwesomeIcons.camera,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.black,
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.white,
        icons: const [
          FontAwesomeIcons.image,
          FontAwesomeIcons.question,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            if (index == 1) {
              // Navigate to the page you want
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SnapTips(),
              ));
            }
          });
          // {
          //   _bottomNavIndex = index;
          // });
        },
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            color: Theme.of(context).colorScheme.tertiary,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.images,
                          size: 60.0,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: SizedBox(
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.camera, size: 60.0),
                          SizedBox(height: 12.0),
                          Text(
                            "Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final picker = ImagePicker();

  _imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    List<int> imageBytes = await imgFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    var url = 'https://teahub-model-deploy-b3efb87f9078.herokuapp.com/predict';

    var requestBody = jsonEncode({
      "image": base64Image,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBody,
      // Use the JSON-encoded data here
    );

    print(response.body);
    print(response.statusCode);
    print("###############--------------------------------------------");
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.containsKey('predicted_class')) {
        String predictedDisease = result['predicted_class'];
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomeScreen(disease: predictedDisease)),
        );
      } else {}
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    }
  }
}
