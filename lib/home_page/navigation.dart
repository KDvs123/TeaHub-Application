import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:chatbotui/home_page/constants.dart';
import 'package:chatbotui/home_page/scanPage.dart';
import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';





class TeaProfilePage extends StatefulWidget {
  const TeaProfilePage({Key? key}) : super(key: key);

  @override
  State<TeaProfilePage> createState() => _TeaProfilePageState();
}

class _TeaProfilePageState extends State<TeaProfilePage> {

  int _bottomNavIndex = 0;



  //List of the pages
  List<Widget> pages= const [
      // // HomePage(),
      // ChatbotPage(),
      // TeaProfilePage(),
      // ProfilePage(),
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            FaIcon(
  FontAwesomeIcons.bell, 
  color: Constants.blackColor,
  size: 30.0,
)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset('assets/images/qr-code-scan.png',height: 30.0,
),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            
          });
        }
       ),
    );
  }
}
