import 'package:flutter/material.dart';
import '../presentation/edit_profile_container_screen/edit_profile_container_screen.dart';


class AppRoutes {
  static const String editProfileContainerScreen =
      '/edit_profile_container_screen';

  static const String editProfilePage = '/edit_profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    editProfileContainerScreen: (context) => EditProfileContainerScreen(),
  
  };
}
