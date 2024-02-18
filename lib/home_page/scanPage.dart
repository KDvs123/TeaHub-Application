import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:chatbotui/home_page/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';


class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = const [
    // // HomePage(),
    // ChatbotPage(),
    // TeaProfilePage(),
    // ProfilePage(),
  ];

  List<IconData> iconList = [
    
    FontAwesomeIcons.images, // Font Awesome gallery icon
    FontAwesomeIcons.question, // Font Awesome question mark icon
    
  ];

  //List of the pages titles
  List<String> titleList = [
    
    'Choose from gallery',
    'Snaptips',
    
  ];

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
                    Image.asset(
                      'assets/images/qr-code-scan.png',
                      height: 500.0,
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
  child: const FaIcon(
    FontAwesomeIcons.stop,
    color: Colors.white,
  ),
),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.black, // Set background color to black
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.white,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
