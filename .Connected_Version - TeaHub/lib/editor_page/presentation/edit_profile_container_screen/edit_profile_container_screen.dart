import '../../presentation/edit_profile_page/edit_profile_page.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class EditProfileContainerScreen extends StatelessWidget {
  EditProfileContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.editProfilePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0)
                    )
                    ),
            bottomNavigationBar: _buildBottomBar(context)
            )
            );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home1svgrepocom:
        return "/";
      case BottomBarEnum.Contrast:
        return "/";
      case BottomBarEnum.Plantpotsvgrepocom:
        return AppRoutes.editProfilePage;
      case BottomBarEnum.Usercirclesvgrepocom:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.editProfilePage:
        return EditProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
