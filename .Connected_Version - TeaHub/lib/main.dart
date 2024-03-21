import 'package:TeaHub/disease_description_treatment/home_screen.dart';
import 'package:TeaHub/disease_description_treatment/welcome_screen.dart';
import 'package:TeaHub/pages/authentication_page.dart';
import 'package:TeaHub/theme/theme.dart';
import 'package:TeaHub/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initializer(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: provider.themeMode,
      );
    });
  }
}
