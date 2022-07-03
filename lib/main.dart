import 'package:bahaa_app/admin_panel/admin_panel.dart';
import 'package:bahaa_app/translation/translation.dart';
import 'package:bahaa_app/ui/base/intro.dart';
import 'package:bahaa_app/ui/base/nav_bar.dart';
import 'package:bahaa_app/utils/material_theme.dart';
import 'package:bahaa_app/utils/shared_prefrences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "XXX",
      //   appId: "XXX",
      //   messagingSenderId: "XXX",
      //   projectId: "XXX",
      // ),
      );
  await MySharedPreferences.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _toggleScreen() {
    if (MySharedPreferences.isPassedIntro) {
      return const BaseNavBar();
    } else {
      return const IntroScreen();
    }
  }

  Widget _adminPanel() {
    return const AdminPanel();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('ar', 'JO'),
      // ],
      locale: const Locale("ar"),
      fallbackLocale: const Locale("ar"),
      theme: AppThemeData().materialTheme,
      home: _toggleScreen(),
      // home: _adminPanel(),
    );
  }
}
