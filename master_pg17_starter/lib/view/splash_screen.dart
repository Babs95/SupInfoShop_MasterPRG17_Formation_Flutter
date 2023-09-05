import 'dart:async';

import 'package:flutter/material.dart';
import 'package:master_pg17_starter/commons/config.dart';
import 'package:master_pg17_starter/commons/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/constant_assets.dart';
import '../commons/constant_color.dart';
import '../commons/constatnt_string.dart';
import '../route/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();

}

class SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  
  setPref() async {
    prefs = await SharedPreferences.getInstance();
    startTime();
  }
  
  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }
  
  route() {
    Navigator.pushReplacementNamed(
      context,
        prefs?.getBool(FIRST_TIME) == null
            ? Routes.onboarding
            : Routes.principal
    );
  }

  @override
  void initState() {
    Config().init(context);
    setPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: splashBackgroundGreyColor,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            child: Center(
              child: Image(
                image: const AssetImage(kImageSplashScreen),
                width: getProportionateScreenWidth(400),
                height: getProportionateScreenHeight(500)
              ),
            ),
          )
        ],
      ),
    );
  }

}