import 'package:bahaa_app/binding/nav_bar.dart';
import 'package:bahaa_app/binding/registration/sign_in.dart';
import 'package:bahaa_app/translation/translation.dart';
import 'package:bahaa_app/ui/base/intro.dart';
import 'package:bahaa_app/ui/base/nav_bar.dart';
import 'package:bahaa_app/utils/material_theme.dart';
import 'package:bahaa_app/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  // options: const FirebaseOptions(
  //   apiKey: "XXX",
  //   appId: "XXX",
  //   messagingSenderId: "XXX",
  //   projectId: "XXX",
  // ),
  // );
  await MySharedPreferences.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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

  Bindings _initialBinding() {
    if (MySharedPreferences.accessToken.isEmpty) {
      return SignInBinding();
    } else {
      return NavBarBinding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: _initialBinding(),
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
    );
  }
}
