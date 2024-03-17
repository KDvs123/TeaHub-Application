import 'package:TeaHub/chatbot_ui_updated/ChatScreen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:TeaHub/TeaDescriptionPage/main.dart';
import 'package:TeaHub/chatbot_ui/main.dart';
//import 'package:chatbotui/chatbot_ui/presentation/chatbot_screen/chatbot_screen.dart';
import 'package:TeaHub/home_page/constants.dart';
import 'package:TeaHub/home_page/scanPage.dart';
import 'package:TeaHub/pages/home_page.dart';
import 'package:TeaHub/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class navigationPage extends StatefulWidget {
  const navigationPage({Key? key}) : super(key: key);

  @override
  State<navigationPage> createState() => _TeaProfilePageState();
}

class _TeaProfilePageState extends State<navigationPage> {
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = [
    HomePage(),
    ChatScreen(), // ChatbotPage(),chatApp()
    TeaProfile(),
    const UserProfile(), // ProfilePage(),
  ];

  List<IconData> iconList = [
    FontAwesomeIcons.home, // Font Awesome home icon
    FontAwesomeIcons.comment, // Chatbot icon
    FontAwesomeIcons.seedling, // Plant icon
    FontAwesomeIcons.user, // Font Awesome user icon
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Chatbot',
    'Tea profile',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         titleList[_bottomNavIndex],
      //         style: TextStyle(
      //           color: Theme.of(context).colorScheme.secondary,
      //           fontWeight: FontWeight.w500,
      //           fontSize: 24,
      //         ),
      //       ),
      //       FaIcon(
      //         FontAwesomeIcons.bell,
      //         color: Theme.of(context).colorScheme.secondary,
      //         size: 30.0,
      //       )
      //     ],
      //   ),
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0.0,
      // ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30.0), // Adjust the radius as needed
        ),
        child: Image.asset(
          'assets/images/qr-code-scan.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.black,
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.grey,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
    );
  }
}
