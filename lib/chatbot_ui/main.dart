import 'package:chatbotui/chatbot_ui/core/utils/size_utils.dart';
import 'package:chatbotui/chatbot_ui/routes/app_routes.dart';
import 'package:chatbotui/chatbot_ui/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'shenali_s_application1',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.chatbotScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
