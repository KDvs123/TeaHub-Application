import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:TeaHub/home_page/constants.dart';
import 'package:TeaHub/snap_tips/SnapTips.dart';
import 'package:TeaHub/introduction_page/scanui_splash.dart';
import 'package:TeaHub/disease_description_treatment/welcome_screen.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _bottomNavIndex = 0;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScanUI(),
        ),
      );
    });
  }

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
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SnapTips(),
              ));
            }
          });
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
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
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
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Image Cropper",
          toolbarColor: Color.fromARGB(255, 78, 203, 128),
          //toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: "Image Cropper",
        )
      ],
    );
    if (croppedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
      ;
      // imageCache.clear();
      // setState(() {
      //   imageFile = File(croppedFile.path);
      // });
    }
  }
}

             



// import 'dart:io';
// import 'dart:js';

// import 'package:TeaHub/disease_description_treatment/home_screen.dart';
// import 'package:TeaHub/disease_description_treatment/welcome_screen.dart';
// import 'package:TeaHub/introduction_page/scanui_splash.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:TeaHub/home_page/constants.dart';
// import 'package:TeaHub/snap_tips/SnapTips.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ScanPage extends StatefulWidget {
//   const ScanPage({Key? key}) : super(key: key);

  

//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }

// @override
// void initState() {
  
//   // Navigating to the ScanUI page automatically when this page is opened
//    // Navigating to the Chat ui page automatically when this page is opened
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => ScanUI(),
//         ),
//       );
//     });
// }

// class _ScanPageState extends State<ScanPage> {
//   int _bottomNavIndex = 0;
//   File? imageFile;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: SizedBox(
//                     height: 40,
//                     width: 40,
//                     child: FaIcon(
//                       FontAwesomeIcons.times,
//                       color: Constants.primaryColor,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     debugPrint('favorite');
//                   },
//                   child: SizedBox(
//                     height: 40,
//                     width: 40,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: FaIcon(
//                         FontAwesomeIcons.syncAlt,
//                         color: Constants.primaryColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 100,
//             right: 20,
//             left: 20,
//             child: Container(
//               width: size.width * .8,
//               height: size.height * .8,
//               padding: const EdgeInsets.all(20),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     imageFile == null
//                         ? Image.asset(
//                             'assets/images/qr-code-scan.png',
//                             height: 500.0,
//                           )
//                         : ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.file(
//                               imageFile!,
//                               height: 500.0,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       '',
//                       style: TextStyle(
//                         color: Constants.primaryColor.withOpacity(.80),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       //----- Code - 1 ------//

//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     _showImagePicker(context);
//       //   },
//       //   backgroundColor: Constants.primaryColor,
//       //   child: const FaIcon(
//       //     FontAwesomeIcons.camera,
//       //     color: Colors.white,
//       //   ),
//       // ),
//       floatingActionButton: ClipRRect(
//         borderRadius:
//             BorderRadius.circular(30.0), // Adjust the value to your preference
//         child: FloatingActionButton(
//           onPressed: () {
//             _showImagePicker(context);
//           },
//           backgroundColor: Constants.primaryColor,
//           child: const FaIcon(
//             FontAwesomeIcons.camera,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         backgroundColor: Colors.black,
//         splashColor: Constants.primaryColor,
//         activeColor: Constants.primaryColor,
//         inactiveColor: Colors.white,
//         icons: const [
//           FontAwesomeIcons.image,
//           FontAwesomeIcons.question,
//         ],
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.softEdge,
//         onTap: (index) {
//           setState(() {
//             _bottomNavIndex = index;
//             if (index == 1) {
//               // Navigate to the page you want
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => SnapTips(),
//               ));
//             }
//           });
//           // {
//           //   _bottomNavIndex = index;
//           // });
//         },
//       ),
//     );
//   }

//   void _showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (builder) {
//         return Card(
//           child: Container(
//             color: Theme.of(context).colorScheme.tertiary,
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 5.2,
//             margin: const EdgeInsets.only(top: 8.0),
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     child: Column(
//                       children: [
//                         FaIcon(
//                           FontAwesomeIcons.images,
//                           size: 60.0,
//                         ),
//                         SizedBox(height: 12.0),
//                         Text(
//                           "Gallery",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Theme.of(context).colorScheme.primary,
//                           ),
//                         )
//                       ],
//                     ),
//                     onTap: () {
//                       _imgFromGallery();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     child: SizedBox(
//                       child: Column(
//                         children: [
//                           FaIcon(FontAwesomeIcons.camera, size: 60.0),
//                           SizedBox(height: 12.0),
//                           Text(
//                             "Camera",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).colorScheme.primary,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   final picker = ImagePicker();

//   _imgFromGallery() async {
//     await picker
//         .pickImage(source: ImageSource.gallery, imageQuality: 50)
//         .then((value) {
//       if (value != null) {
//         _cropImage(File(value.path));
//       }
//     });
//   }

//   _imgFromCamera() async {
//     await picker
//         .pickImage(source: ImageSource.camera, imageQuality: 50)
//         .then((value) {
//       if (value != null) {
//         _cropImage(File(value.path));
//       }
//     });
//   }

//   _cropImage(File imgFile) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imgFile.path,
//       aspectRatioPresets: Platform.isAndroid
//           ? [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio16x9
//             ]
//           : [
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio5x3,
//               CropAspectRatioPreset.ratio5x4,
//               CropAspectRatioPreset.ratio7x5,
//               CropAspectRatioPreset.ratio16x9
//             ],
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: "Image Cropper",
//           toolbarColor: Color.fromARGB(255, 78, 203, 128),
//           //toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//         ),
//         IOSUiSettings(
//           title: "Image Cropper",
//         )
//       ],
//     );
//     if (croppedFile != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => WelcomeScreen()),
//       );
//       ;
//       // imageCache.clear();
//       // setState(() {
//       //   imageFile = File(croppedFile.path);
//       // });
//     }
//   }
// }
