import 'package:TeaHub/home_page/main_interface.dart';
import 'package:TeaHub/pages/authentication_page.dart';
import 'package:TeaHub/theme/theme.dart';
import 'package:TeaHub/theme/theme_button.dart';
import 'package:TeaHub/theme/theme_provider.dart';
import 'package:flutter/material.dart';
//import 'package:teahub/pages/authentication_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => ThemeProvider(),
      //   child: const MyApp(),
      // ),
      ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider()..initializer(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthPage(), //Scene(), //
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: provider.themeMode,
      );
    });
  }
}
