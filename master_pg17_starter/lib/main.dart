import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_pg17_starter/route/routes.dart';
import 'package:master_pg17_starter/view/accueil/accueil.dart';
import 'package:master_pg17_starter/view/onboarding/onboarding_screen.dart';
import 'package:master_pg17_starter/view/principal.dart';
import 'package:master_pg17_starter/view/splash_screen.dart';

import 'commons/constatnt_string.dart';
import 'commons/theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) async {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: lightThemeData(context),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        Routes.onboarding: (BuildContext context) => const OnBoardingScreen(),
        Routes.principal: (BuildContext context) => const PrincipalScreen(),
        Routes.home: (BuildContext context) => const AccueilScreen(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const PrincipalScreen(),
        );
      },
    );
  }
}