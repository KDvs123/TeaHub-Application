import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'package:chatbotui/chatbot_ui/core/utils/size_utils.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome1SvgrepoCom,
      activeIcon: ImageConstant.imgHome1SvgrepoCom,
      type: BottomBarEnum.Home1svgrepocom,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgContrast,
      activeIcon: ImageConstant.imgContrast,
      type: BottomBarEnum.Contrast,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlantPotSvgrepoCom,
      activeIcon: ImageConstant.imgPlantPotSvgrepoCom,
      type: BottomBarEnum.Plantpotsvgrepocom,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserCircleSvgrepoCom,
      activeIcon: ImageConstant.imgUserCircleSvgrepoCom,
      type: BottomBarEnum.Usercirclesvgrepocom,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.v,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgGroup10,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              color: appTheme.whiteA700,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              color: theme.colorScheme.onPrimary,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home1svgrepocom,
  Contrast,
  Plantpotsvgrepocom,
  Usercirclesvgrepocom,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
