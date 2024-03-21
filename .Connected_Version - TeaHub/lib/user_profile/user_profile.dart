import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:TeaHub/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;
  // ignore: unused_field
  String? _imageUrl; //To store the URL of the uploaded image.

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // upload image to Firebase storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_image')
          .child('profile_${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(_imageFile!);

      //Get download URL
      String imageUrl = await ref.getDownloadURL();

      setState(() {
        _imageUrl = imageUrl; //Update the imageUrl
      });

      //Use the imageUrl as needed.
      print('Uploaded image URL: $imageUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // userprofilegyM (226:2601)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroupqvxhcs1 (9njecn1HncthMNQkxpQVxh)
              width: 390 * fem,
              height: 355 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle51jgj (226:2630)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 380 * fem,
                        height: 263 * fem,
                        child: Image.asset(
                          'assets/images/user_profile/rectangle-51.png',
                          width: 390 * fem,
                          height: 263 * fem,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   // toprWT (226:2631)
                  //   left: 24 * fem,
                  //   top: 69 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 350 * fem,
                  //       height: 24 * fem,
                  //        child: Image.asset(
                  //         'assets/images/user_profile/top.png',
                  //          width: 350 * fem,
                  //          height: 24 * fem,
                  //        ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    // group71AJB (226:2650)
                    left: 84.5 * fem,
                    top: 171 * fem,
                    child: Container(
                      width: 221 * fem,
                      height: 184 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _selectImage,
                            child: Container(
                              // avatartEB (226:2651)
                              margin: EdgeInsets.fromLTRB(
                                  47.5 * fem, 0 * fem, 46.5 * fem, 0 * fem),
                              width: double.infinity,
                              height: 130 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle6RV1 (I226:2652;218:102701)
                                    left: 0 * fem,
                                    top: 0 * fem,
                                    child: SizedBox(
                                      width: 120 * fem,
                                      height: 120 * fem,
                                      child: _imageFile != null
                                          ? Image.file(
                                              _imageFile!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/images/user_profile/rectangle-6.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    // edit icon
                                    left: 81 * fem,
                                    top: 84 * fem,
                                    child: GestureDetector(
                                      onTap: _selectImage,
                                      child: SizedBox(
                                        width: 46 * fem,
                                        height: 46 * fem,
                                        child: Image.asset(
                                          'assets/images/user_profile/group-62.png',
                                          width: 46 * fem,
                                          height: 46 * fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // vihangasupasanzwR (226:2656)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 6 * fem),
                            child: Text(
                              'Vihanga Supasan',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 22 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2727272727 * ffem / fem,
                                //color: const Color(0xff000000),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          Text(
                            // vs2001gmailcom0772026018JSK (226:2657)
                            'vs2001@gmail.com | 0772026018',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.4285714286 * ffem / fem,
                              letterSpacing: 0.25 * fem,
                              //color: const Color(0xff000000),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupa6b7pQf (9njfGg5ouQpJKDWi1Pa6b7)
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 45 * fem, 9 * fem, 10 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group70M9h (226:2753)
                    margin: EdgeInsets.fromLTRB(
                        4 * fem, 0 * fem, 0 * fem, 45 * fem),
                    padding: EdgeInsets.fromLTRB(
                        16 * fem, 14 * fem, 24 * fem, 11 * fem),
                    width: 342 * fem,
                    decoration: BoxDecoration(
                      //color: const Color(0xffffffff),
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0 * fem, 1 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // component11zCf (226:2755)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 11 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 117 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // linebusinessprofilelinehMy (I226:2755;226:2370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/line-business-profile-line.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to the edit profile page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                },
                                child: Text(
                                  'Edit profile information',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4285714286 * ffem / fem,
                                    letterSpacing: 0.25 * fem,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),

                              // GestureDetector(
                              //   onTap: () {
                              //     // Navigate to the edit profile page
                              //     Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => EditProfilePage()),
                              //     );
                              //     },
                              //     child: Text(
                              //       'Edit profile information',
                              //       style: GoogleFonts.roboto(
                              //         fontSize: 14 * ffem,
                              //         fontWeight: FontWeight.w400,
                              //         height: 1.4285714286 * ffem / fem,
                              //         letterSpacing: 0.25 * fem,
                              //         color: Theme.of(context).colorScheme.primary,
                              //         ),
                              //       ),
                              //     )

                              // Text(
                              //   // editprofileinformationQGP (I226:2755;226:2371)
                              //   'Edit profile information',
                              //   style: GoogleFonts.roboto(
                              //     fontSize: 14 * ffem,
                              //     fontWeight: FontWeight.w400,
                              //     height: 1.4285714286 * ffem / fem,
                              //     letterSpacing: 0.25 * fem,
                              //     //color: const Color(0xff000000),
                              //     color: Theme.of(context).colorScheme.primary,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          // component12LA3 (226:2756)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // linemedianotification3line4Lw (I226:2756;226:2370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/line-media-notification-3-line.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              Container(
                                // editprofileinformationyTu (I226:2756;226:2371)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 161 * fem, 0 * fem),
                                child: Text(
                                  'Notifications',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4285714286 * ffem / fem,
                                    letterSpacing: 0.25 * fem,
                                    //color: const Color(0xff000000),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              Text(
                                // englishea3 (I226:2756;226:2372)
                                'ON',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.roboto(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4285714286 * ffem / fem,
                                  letterSpacing: 0.25 * fem,
                                  color: const Color(0xff4ecb81),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // component13P1q (226:2757)
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 212 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupoclv7iX (9njg4V6oyoBkeHR9keocLV)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/auto-group-oclv.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              Text(
                                // editprofileinformation2qV (I226:2757;226:2371)
                                'Security',
                                style: GoogleFonts.roboto(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4285714286 * ffem / fem,
                                  letterSpacing: 0.25 * fem,
                                  //color: const Color(0xff000000),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group69ZaX (226:2730)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        16 * fem, 14 * fem, 24 * fem, 11 * fem),
                    width: 342 * fem,
                    decoration: BoxDecoration(
                      //color: const Color(0xffffffff),
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0 * fem, 1 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // component113Eo (226:2732)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 11 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 167 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // lineusercontactslineXvf (I226:2732;226:2370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/line-user-contacts-line.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              Text(
                                // editprofileinformationrT9 (I226:2732;226:2371)
                                'Help & Support',
                                style: GoogleFonts.roboto(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4285714286 * ffem / fem,
                                  letterSpacing: 0.25 * fem,
                                  //color: const Color(0xff000000),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // component12PT5 (226:2733)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 195 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // linecommunicationchatquoteline (I226:2733;226:2370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/line-communication-chat-quote-line.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              Text(
                                // editprofileinformationq4B (I226:2733;226:2371)
                                'Contact us',
                                style: GoogleFonts.roboto(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4285714286 * ffem / fem,
                                  letterSpacing: 0.25 * fem,
                                  //color: const Color(0xff000000),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // component13Zks (226:2734)
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 176 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // linesystemlock2lineuZq (I226:2734;226:2370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/images/user_profile/line-system-lock-2-line.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                              Text(
                                // editprofileinformationo9R (I226:2734;226:2371)
                                'Privacy policy',
                                style: GoogleFonts.roboto(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4285714286 * ffem / fem,
                                  letterSpacing: 0.25 * fem,
                                  //color: const Color(0xff000000),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   // menu1vzj (226:2663)
            //   width: 428 * fem,
            //   height: 115 * fem,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         // floatbtngDD (I226:2663;405:7322)
            //         left: 155 * fem,
            //         top: 0 * fem,
            //         child: Align(
            //           child: SizedBox(
            //             width: 64 * fem,
            //             height: 64 * fem,
            //             child: Image.asset(
            //               'assets/images/user_profile/float-btn-5hq.png',
            //               width: 64 * fem,
            //               height: 64 * fem,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         // bgaJb (I226:2663;405:7324)
            //         left: 0 * fem,
            //         top: 40 * fem,
            //         child: Align(
            //           child: SizedBox(
            //             width: 375 * fem,
            //             height: 75 * fem,
            //             child: Image.asset(
            //               'assets/images/user_profile/bg-ysV.png',
            //               width: 375 * fem,
            //               height: 75 * fem,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         // scansvgrepocomu5y (226:2704)
            //         left: 167 * fem,
            //         top: 14 * fem,
            //         child: Align(
            //           child: SizedBox(
            //             width: 40 * fem,
            //             height: 40 * fem,
            //             child: Image.asset(
            //               'assets/images/user_profile/scansvgrepocom-N6T.png',
            //               width: 40 * fem,
            //               height: 40 * fem,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:io';
// import 'dart:ui';
// import 'package:TeaHub/pages/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_storage/firebase_storage.dart';

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//       };
// }

// class UserProfile extends StatefulWidget {
//   const UserProfile({Key? key}) : super(key: key);

//   @override
//   _UserProfileState createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   File? _imageFile;

//   Future<void> _selectImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 375;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Container(
//       width: double.infinity,
//       child: Container(
//         // userprofilegyM (226:2601)
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.background,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               // autogroupqvxhcs1 (9njecn1HncthMNQkxpQVxh)
//               width: 390 * fem,
//               height: 355 * fem,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     // rectangle51jgj (226:2630)
//                     left: 0 * fem,
//                     top: 0 * fem,
//                     child: Align(
//                       child: SizedBox(
//                         width: 380 * fem,
//                         height: 263 * fem,
//                         child: Image.asset(
//                           'assets/images/user_profile/rectangle-51.png',
//                           width: 390 * fem,
//                           height: 263 * fem,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //   // toprWT (226:2631)
//                   //   left: 24 * fem,
//                   //   top: 69 * fem,
//                   //   child: Align(
//                   //     child: SizedBox(
//                   //       width: 350 * fem,
//                   //       height: 24 * fem,
//                   //        child: Image.asset(
//                   //         'assets/images/user_profile/top.png',
//                   //          width: 350 * fem,
//                   //          height: 24 * fem,
//                   //        ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Positioned(
//                     // group71AJB (226:2650)
//                     left: 84.5 * fem,
//                     top: 171 * fem,
//                     child: Container(
//                       width: 221 * fem,
//                       height: 184 * fem,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             // avatartEB (226:2651)
//                             margin: EdgeInsets.fromLTRB(
//                                 47.5 * fem, 0 * fem, 46.5 * fem, 0 * fem),
//                             width: double.infinity,
//                             height: 130 * fem,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   // rectangle6RV1 (I226:2652;218:102701)
//                                   left: 0 * fem,
//                                   top: 0 * fem,
//                                   child: SizedBox(
//                                     width: 120 * fem,
//                                     height: 120 * fem,
//                                     child: _imageFile != null
//                                         ? Image.file(
//                                             _imageFile!,
//                                             fit: BoxFit.cover,
//                                           )
//                                         : Image.asset(
//                                             'assets/images/user_profile/rectangle-6.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   // edit icon
//                                   left: 81 * fem,
//                                   top: 84 * fem,
//                                   child: GestureDetector(
//                                     onTap: _selectImage,
//                                     child: SizedBox(
//                                       width: 46 * fem,
//                                       height: 46 * fem,
//                                       child: Image.asset(
//                                         'assets/images/user_profile/group-62.png',
//                                         width: 46 * fem,
//                                         height: 46 * fem,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             // vihangasupasanzwR (226:2656)
//                             margin: EdgeInsets.fromLTRB(
//                                 0 * fem, 0 * fem, 1 * fem, 6 * fem),
//                             child: Text(
//                               'Vihanga Supasan',
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 22 * ffem,
//                                 fontWeight: FontWeight.w600,
//                                 height: 1.2727272727 * ffem / fem,
//                                 //color: const Color(0xff000000),
//                                 color: Theme.of(context).colorScheme.primary,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             // vs2001gmailcom0772026018JSK (226:2657)
//                             'vs2001@gmail.com | 0772026018',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.roboto(
//                               fontSize: 14 * ffem,
//                               fontWeight: FontWeight.w400,
//                               height: 1.4285714286 * ffem / fem,
//                               letterSpacing: 0.25 * fem,
//                               //color: const Color(0xff000000),
//                               color: Theme.of(context).colorScheme.primary,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               // autogroupa6b7pQf (9njfGg5ouQpJKDWi1Pa6b7)
//               padding:
//                   EdgeInsets.fromLTRB(20 * fem, 45 * fem, 9 * fem, 10 * fem),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     // group70M9h (226:2753)
//                     margin: EdgeInsets.fromLTRB(
//                         4 * fem, 0 * fem, 0 * fem, 45 * fem),
//                     padding: EdgeInsets.fromLTRB(
//                         16 * fem, 14 * fem, 24 * fem, 11 * fem),
//                     width: 342 * fem,
//                     decoration: BoxDecoration(
//                       //color: const Color(0xffffffff),
//                       color: Theme.of(context).colorScheme.tertiary,
//                       borderRadius: BorderRadius.circular(8 * fem),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0x3f000000),
//                           offset: Offset(0 * fem, 1 * fem),
//                           blurRadius: 2 * fem,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           // component11zCf (226:2755)
//                           margin: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 0 * fem, 11 * fem),
//                           padding: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 117 * fem, 0 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // linebusinessprofilelinehMy (I226:2755;226:2370)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/line-business-profile-line.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Navigate to the edit profile page
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => HomePage()),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Edit profile information',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: 14 * ffem,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.4285714286 * ffem / fem,
//                                     letterSpacing: 0.25 * fem,
//                                     color:
//                                         Theme.of(context).colorScheme.primary,
//                                   ),
//                                 ),
//                               ),

//                               // GestureDetector(
//                               //   onTap: () {
//                               //     // Navigate to the edit profile page
//                               //     Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(builder: (context) => EditProfilePage()),
//                               //     );
//                               //     },
//                               //     child: Text(
//                               //       'Edit profile information',
//                               //       style: GoogleFonts.roboto(
//                               //         fontSize: 14 * ffem,
//                               //         fontWeight: FontWeight.w400,
//                               //         height: 1.4285714286 * ffem / fem,
//                               //         letterSpacing: 0.25 * fem,
//                               //         color: Theme.of(context).colorScheme.primary,
//                               //         ),
//                               //       ),
//                               //     )

//                               // Text(
//                               //   // editprofileinformationQGP (I226:2755;226:2371)
//                               //   'Edit profile information',
//                               //   style: GoogleFonts.roboto(
//                               //     fontSize: 14 * ffem,
//                               //     fontWeight: FontWeight.w400,
//                               //     height: 1.4285714286 * ffem / fem,
//                               //     letterSpacing: 0.25 * fem,
//                               //     //color: const Color(0xff000000),
//                               //     color: Theme.of(context).colorScheme.primary,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           // component12LA3 (226:2756)
//                           margin: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 0 * fem, 13 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // linemedianotification3line4Lw (I226:2756;226:2370)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/line-media-notification-3-line.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               Container(
//                                 // editprofileinformationyTu (I226:2756;226:2371)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 161 * fem, 0 * fem),
//                                 child: Text(
//                                   'Notifications',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: 14 * ffem,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.4285714286 * ffem / fem,
//                                     letterSpacing: 0.25 * fem,
//                                     //color: const Color(0xff000000),
//                                     color:
//                                         Theme.of(context).colorScheme.primary,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 // englishea3 (I226:2756;226:2372)
//                                 'ON',
//                                 textAlign: TextAlign.right,
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 14 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.4285714286 * ffem / fem,
//                                   letterSpacing: 0.25 * fem,
//                                   color: const Color(0xff4ecb81),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           // component13P1q (226:2757)
//                           padding: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 212 * fem, 0 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // autogroupoclv7iX (9njg4V6oyoBkeHR9keocLV)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/auto-group-oclv.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 // editprofileinformation2qV (I226:2757;226:2371)
//                                 'Security',
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 14 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.4285714286 * ffem / fem,
//                                   letterSpacing: 0.25 * fem,
//                                   //color: const Color(0xff000000),
//                                   color: Theme.of(context).colorScheme.primary,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // group69ZaX (226:2730)
//                     margin:
//                         EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 0 * fem),
//                     padding: EdgeInsets.fromLTRB(
//                         16 * fem, 14 * fem, 24 * fem, 11 * fem),
//                     width: 342 * fem,
//                     decoration: BoxDecoration(
//                       //color: const Color(0xffffffff),
//                       color: Theme.of(context).colorScheme.tertiary,
//                       borderRadius: BorderRadius.circular(8 * fem),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0x3f000000),
//                           offset: Offset(0 * fem, 1 * fem),
//                           blurRadius: 2 * fem,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           // component113Eo (226:2732)
//                           margin: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 0 * fem, 11 * fem),
//                           padding: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 167 * fem, 0 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // lineusercontactslineXvf (I226:2732;226:2370)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/line-user-contacts-line.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 // editprofileinformationrT9 (I226:2732;226:2371)
//                                 'Help & Support',
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 14 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.4285714286 * ffem / fem,
//                                   letterSpacing: 0.25 * fem,
//                                   //color: const Color(0xff000000),
//                                   color: Theme.of(context).colorScheme.primary,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           // component12PT5 (226:2733)
//                           margin: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 0 * fem, 13 * fem),
//                           padding: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 195 * fem, 0 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // linecommunicationchatquoteline (I226:2733;226:2370)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/line-communication-chat-quote-line.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 // editprofileinformationq4B (I226:2733;226:2371)
//                                 'Contact us',
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 14 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.4285714286 * ffem / fem,
//                                   letterSpacing: 0.25 * fem,
//                                   //color: const Color(0xff000000),
//                                   color: Theme.of(context).colorScheme.primary,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           // component13Zks (226:2734)
//                           padding: EdgeInsets.fromLTRB(
//                               0 * fem, 0 * fem, 176 * fem, 0 * fem),
//                           width: double.infinity,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // linesystemlock2lineuZq (I226:2734;226:2370)
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
//                                 width: 24 * fem,
//                                 height: 24 * fem,
//                                 child: Image.asset(
//                                   'assets/images/user_profile/line-system-lock-2-line.png',
//                                   width: 24 * fem,
//                                   height: 24 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 // editprofileinformationo9R (I226:2734;226:2371)
//                                 'Privacy policy',
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 14 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.4285714286 * ffem / fem,
//                                   letterSpacing: 0.25 * fem,
//                                   //color: const Color(0xff000000),
//                                   color: Theme.of(context).colorScheme.primary,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Container(
//             //   // menu1vzj (226:2663)
//             //   width: 428 * fem,
//             //   height: 115 * fem,
//             //   child: Stack(
//             //     children: [
//             //       Positioned(
//             //         // floatbtngDD (I226:2663;405:7322)
//             //         left: 155 * fem,
//             //         top: 0 * fem,
//             //         child: Align(
//             //           child: SizedBox(
//             //             width: 64 * fem,
//             //             height: 64 * fem,
//             //             child: Image.asset(
//             //               'assets/images/user_profile/float-btn-5hq.png',
//             //               width: 64 * fem,
//             //               height: 64 * fem,
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Positioned(
//             //         // bgaJb (I226:2663;405:7324)
//             //         left: 0 * fem,
//             //         top: 40 * fem,
//             //         child: Align(
//             //           child: SizedBox(
//             //             width: 375 * fem,
//             //             height: 75 * fem,
//             //             child: Image.asset(
//             //               'assets/images/user_profile/bg-ysV.png',
//             //               width: 375 * fem,
//             //               height: 75 * fem,
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Positioned(
//             //         // scansvgrepocomu5y (226:2704)
//             //         left: 167 * fem,
//             //         top: 14 * fem,
//             //         child: Align(
//             //           child: SizedBox(
//             //             width: 40 * fem,
//             //             height: 40 * fem,
//             //             child: Image.asset(
//             //               'assets/images/user_profile/scansvgrepocom-N6T.png',
//             //               width: 40 * fem,
//             //               height: 40 * fem,
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // import 'dart:ui';

// // import 'package:TeaHub/editor_page/presentation/edit_profile_page/edit_profile_page.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class MyCustomScrollBehavior extends MaterialScrollBehavior {
// //   @override
// //   Set<PointerDeviceKind> get dragDevices => {
// //         PointerDeviceKind.touch,
// //         PointerDeviceKind.mouse,
// //       };
// // }

// // class UserProfile extends StatelessWidget {
// //   const UserProfile({Key? key});
// //   @override
// //   Widget build(BuildContext context) {
// //     double baseWidth = 375;
// //     double fem = MediaQuery.of(context).size.width / baseWidth;
// //     double ffem = fem * 0.97;
// //     return Container(
// //       width: double.infinity,
// //       child: Container(
// //         // userprofilegyM (226:2601)
// //         width: double.infinity,
// //         decoration: BoxDecoration(
// //           color: Theme.of(context).colorScheme.background,
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               // autogroupqvxhcs1 (9njecn1HncthMNQkxpQVxh)
// //               width: 390 * fem,
// //               height: 355 * fem,
// //               child: Stack(
// //                 children: [
// //                   Positioned(
// //                     // rectangle51jgj (226:2630)
// //                     left: 0 * fem,
// //                     top: 0 * fem,
// //                     child: Align(
// //                       child: SizedBox(
// //                         width: 380 * fem,
// //                         height: 263 * fem,
// //                         child: Image.asset(
// //                           'assets/images/user_profile/rectangle-51.png',
// //                           width: 390 * fem,
// //                           height: 263 * fem,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   // Positioned(
// //                   //   // toprWT (226:2631)
// //                   //   left: 24 * fem,
// //                   //   top: 69 * fem,
// //                   //   child: Align(
// //                   //     child: SizedBox(
// //                   //       width: 350 * fem,
// //                   //       height: 24 * fem,
// //                   //        child: Image.asset(
// //                   //         'assets/images/user_profile/top.png',
// //                   //          width: 350 * fem,
// //                   //          height: 24 * fem,
// //                   //        ),
// //                   //     ),
// //                   //   ),
// //                   // ),
// //                   Positioned(
// //                     // group71AJB (226:2650)
// //                     left: 84.5 * fem,
// //                     top: 171 * fem,
// //                     child: Container(
// //                       width: 221 * fem,
// //                       height: 184 * fem,
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Container(
// //                             // avatartEB (226:2651)
// //                             margin: EdgeInsets.fromLTRB(
// //                                 47.5 * fem, 0 * fem, 46.5 * fem, 0 * fem),
// //                             width: double.infinity,
// //                             height: 130 * fem,
// //                             child: Stack(
// //                               children: [
// //                                 Positioned(
// //                                   // rectangle6RV1 (I226:2652;218:102701)
// //                                   left: 0 * fem,
// //                                   top: 0 * fem,
// //                                   child: Align(
// //                                     child: SizedBox(
// //                                       width: 120 * fem,
// //                                       height: 120 * fem,
// //                                       child: Image.asset(
// //                                         'assets/images/user_profile/rectangle-6.png',
// //                                         fit: BoxFit.cover,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Positioned(
// //                                   // group627cj (226:2653)
// //                                   left: 81 * fem,
// //                                   top: 84 * fem,
// //                                   child: Align(
// //                                     child: SizedBox(
// //                                       width: 46 * fem,
// //                                       height: 46 * fem,
// //                                       child: Image.asset(
// //                                         'assets/images/user_profile/group-62.png',
// //                                         width: 46 * fem,
// //                                         height: 46 * fem,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                             // vihangasupasanzwR (226:2656)
// //                             margin: EdgeInsets.fromLTRB(
// //                                 0 * fem, 0 * fem, 1 * fem, 6 * fem),
// //                             child: Text(
// //                               'Vihanga Supasan',
// //                               textAlign: TextAlign.center,
// //                               style: GoogleFonts.poppins(
// //                                 fontSize: 22 * ffem,
// //                                 fontWeight: FontWeight.w600,
// //                                 height: 1.2727272727 * ffem / fem,
// //                                 //color: const Color(0xff000000),
// //                                 color: Theme.of(context).colorScheme.primary,
// //                               ),
// //                             ),
// //                           ),
// //                           Text(
// //                             // vs2001gmailcom0772026018JSK (226:2657)
// //                             'vs2001@gmail.com | 0772026018',
// //                             textAlign: TextAlign.center,
// //                             style: GoogleFonts.roboto(
// //                               fontSize: 14 * ffem,
// //                               fontWeight: FontWeight.w400,
// //                               height: 1.4285714286 * ffem / fem,
// //                               letterSpacing: 0.25 * fem,
// //                               //color: const Color(0xff000000),
// //                               color: Theme.of(context).colorScheme.primary,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               // autogroupa6b7pQf (9njfGg5ouQpJKDWi1Pa6b7)
// //               padding:
// //                   EdgeInsets.fromLTRB(20 * fem, 45 * fem, 9 * fem, 10 * fem),
// //               width: double.infinity,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Container(
// //                     // group70M9h (226:2753)
// //                     margin: EdgeInsets.fromLTRB(
// //                         4 * fem, 0 * fem, 0 * fem, 45 * fem),
// //                     padding: EdgeInsets.fromLTRB(
// //                         16 * fem, 14 * fem, 24 * fem, 11 * fem),
// //                     width: 342 * fem,
// //                     decoration: BoxDecoration(
// //                       //color: const Color(0xffffffff),
// //                       color: Theme.of(context).colorScheme.tertiary,
// //                       borderRadius: BorderRadius.circular(8 * fem),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: const Color(0x3f000000),
// //                           offset: Offset(0 * fem, 1 * fem),
// //                           blurRadius: 2 * fem,
// //                         ),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Container(
// //                           // component11zCf (226:2755)
// //                           margin: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 0 * fem, 11 * fem),
// //                           padding: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 117 * fem, 0 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // linebusinessprofilelinehMy (I226:2755;226:2370)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/line-business-profile-line.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               GestureDetector(
// //                                 onTap: () {
// //                                   // Navigate to the edit profile page
// //                                   Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             EditProfilePage()),
// //                                   );
// //                                 },
// //                                 child: Text(
// //                                   'Edit profile information',
// //                                   style: GoogleFonts.roboto(
// //                                     fontSize: 14 * ffem,
// //                                     fontWeight: FontWeight.w400,
// //                                     height: 1.4285714286 * ffem / fem,
// //                                     letterSpacing: 0.25 * fem,
// //                                     color:
// //                                         Theme.of(context).colorScheme.primary,
// //                                   ),
// //                                 ),
// //                               )

// //                               // Text(
// //                               //   // editprofileinformationQGP (I226:2755;226:2371)
// //                               //   'Edit profile information',
// //                               //   style: GoogleFonts.roboto(
// //                               //     fontSize: 14 * ffem,
// //                               //     fontWeight: FontWeight.w400,
// //                               //     height: 1.4285714286 * ffem / fem,
// //                               //     letterSpacing: 0.25 * fem,
// //                               //     //color: const Color(0xff000000),
// //                               //     color: Theme.of(context).colorScheme.primary,
// //                               //   ),
// //                               // ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           // component12LA3 (226:2756)
// //                           margin: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 0 * fem, 13 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // linemedianotification3line4Lw (I226:2756;226:2370)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/line-media-notification-3-line.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               Container(
// //                                 // editprofileinformationyTu (I226:2756;226:2371)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 161 * fem, 0 * fem),
// //                                 child: Text(
// //                                   'Notifications',
// //                                   style: GoogleFonts.roboto(
// //                                     fontSize: 14 * ffem,
// //                                     fontWeight: FontWeight.w400,
// //                                     height: 1.4285714286 * ffem / fem,
// //                                     letterSpacing: 0.25 * fem,
// //                                     //color: const Color(0xff000000),
// //                                     color:
// //                                         Theme.of(context).colorScheme.primary,
// //                                   ),
// //                                 ),
// //                               ),
// //                               Text(
// //                                 // englishea3 (I226:2756;226:2372)
// //                                 'ON',
// //                                 textAlign: TextAlign.right,
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 14 * ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.4285714286 * ffem / fem,
// //                                   letterSpacing: 0.25 * fem,
// //                                   color: const Color(0xff4ecb81),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           // component13P1q (226:2757)
// //                           padding: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 212 * fem, 0 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // autogroupoclv7iX (9njg4V6oyoBkeHR9keocLV)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/auto-group-oclv.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 // editprofileinformation2qV (I226:2757;226:2371)
// //                                 'Security',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 14 * ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.4285714286 * ffem / fem,
// //                                   letterSpacing: 0.25 * fem,
// //                                   //color: const Color(0xff000000),
// //                                   color: Theme.of(context).colorScheme.primary,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     // group69ZaX (226:2730)
// //                     margin:
// //                         EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 0 * fem),
// //                     padding: EdgeInsets.fromLTRB(
// //                         16 * fem, 14 * fem, 24 * fem, 11 * fem),
// //                     width: 342 * fem,
// //                     decoration: BoxDecoration(
// //                       //color: const Color(0xffffffff),
// //                       color: Theme.of(context).colorScheme.tertiary,
// //                       borderRadius: BorderRadius.circular(8 * fem),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: const Color(0x3f000000),
// //                           offset: Offset(0 * fem, 1 * fem),
// //                           blurRadius: 2 * fem,
// //                         ),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Container(
// //                           // component113Eo (226:2732)
// //                           margin: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 0 * fem, 11 * fem),
// //                           padding: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 167 * fem, 0 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // lineusercontactslineXvf (I226:2732;226:2370)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/line-user-contacts-line.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 // editprofileinformationrT9 (I226:2732;226:2371)
// //                                 'Help & Support',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 14 * ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.4285714286 * ffem / fem,
// //                                   letterSpacing: 0.25 * fem,
// //                                   //color: const Color(0xff000000),
// //                                   color: Theme.of(context).colorScheme.primary,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           // component12PT5 (226:2733)
// //                           margin: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 0 * fem, 13 * fem),
// //                           padding: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 195 * fem, 0 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // linecommunicationchatquoteline (I226:2733;226:2370)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/line-communication-chat-quote-line.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 // editprofileinformationq4B (I226:2733;226:2371)
// //                                 'Contact us',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 14 * ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.4285714286 * ffem / fem,
// //                                   letterSpacing: 0.25 * fem,
// //                                   //color: const Color(0xff000000),
// //                                   color: Theme.of(context).colorScheme.primary,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           // component13Zks (226:2734)
// //                           padding: EdgeInsets.fromLTRB(
// //                               0 * fem, 0 * fem, 176 * fem, 0 * fem),
// //                           width: double.infinity,
// //                           child: Row(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 // linesystemlock2lineuZq (I226:2734;226:2370)
// //                                 margin: EdgeInsets.fromLTRB(
// //                                     0 * fem, 0 * fem, 13 * fem, 0 * fem),
// //                                 width: 24 * fem,
// //                                 height: 24 * fem,
// //                                 child: Image.asset(
// //                                   'assets/images/user_profile/line-system-lock-2-line.png',
// //                                   width: 24 * fem,
// //                                   height: 24 * fem,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 // editprofileinformationo9R (I226:2734;226:2371)
// //                                 'Privacy policy',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 14 * ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.4285714286 * ffem / fem,
// //                                   letterSpacing: 0.25 * fem,
// //                                   //color: const Color(0xff000000),
// //                                   color: Theme.of(context).colorScheme.primary,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // Container(
// //             //   // menu1vzj (226:2663)
// //             //   width: 428 * fem,
// //             //   height: 115 * fem,
// //             //   child: Stack(
// //             //     children: [
// //             //       Positioned(
// //             //         // floatbtngDD (I226:2663;405:7322)
// //             //         left: 155 * fem,
// //             //         top: 0 * fem,
// //             //         child: Align(
// //             //           child: SizedBox(
// //             //             width: 64 * fem,
// //             //             height: 64 * fem,
// //             //             child: Image.asset(
// //             //               'assets/images/user_profile/float-btn-5hq.png',
// //             //               width: 64 * fem,
// //             //               height: 64 * fem,
// //             //             ),
// //             //           ),
// //             //         ),
// //             //       ),
// //             //       Positioned(
// //             //         // bgaJb (I226:2663;405:7324)
// //             //         left: 0 * fem,
// //             //         top: 40 * fem,
// //             //         child: Align(
// //             //           child: SizedBox(
// //             //             width: 375 * fem,
// //             //             height: 75 * fem,
// //             //             child: Image.asset(
// //             //               'assets/images/user_profile/bg-ysV.png',
// //             //               width: 375 * fem,
// //             //               height: 75 * fem,
// //             //             ),
// //             //           ),
// //             //         ),
// //             //       ),
// //             //       Positioned(
// //             //         // scansvgrepocomu5y (226:2704)
// //             //         left: 167 * fem,
// //             //         top: 14 * fem,
// //             //         child: Align(
// //             //           child: SizedBox(
// //             //             width: 40 * fem,
// //             //             height: 40 * fem,
// //             //             child: Image.asset(
// //             //               'assets/images/user_profile/scansvgrepocom-N6T.png',
// //             //               width: 40 * fem,
// //             //               height: 40 * fem,
// //             //             ),
// //             //           ),
// //             //         ),
// //             //       ),
// //             //     ],
// //             //   ),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
