import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:logger/logger.dart';
import 'package:master_pg17_starter/commons/constant_assets.dart';
import 'package:master_pg17_starter/commons/constant_color.dart';
import 'package:master_pg17_starter/commons/constatnt_string.dart';
import 'package:master_pg17_starter/commons/size_config.dart';
import 'package:master_pg17_starter/model/onboarding_model.dart';
import 'package:master_pg17_starter/route/routes.dart';
import 'package:master_pg17_starter/state_controller/onboarding_state_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingStateController());
  SharedPreferences? prefs;

  @override
  void initState() {
    initiateSharedPreference();
    super.initState();
  }

  initiateSharedPreference() async{
    prefs = await SharedPreferences.getInstance();
    prefs?.setBool(FIRST_TIME, false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kOnBoardingImage1,
          title: kOnboardingTitle1,
          subTitle: kOnboardingSubTitle1,
          counterText: kOnboardingCounter1,
          bgColor: kOnBoardingPage1Color
        ),
      ),

      OnBoardingPageWidget(
        model: OnBoardingModel(
            image: kOnBoardingImage2,
            title: kOnboardingTitle2,
            subTitle: kOnboardingSubTitle2,
            counterText: kOnboardingCounter2,
            bgColor: kOnBoardingPage2Color
        ),
      ),

      OnBoardingPageWidget(
        model: OnBoardingModel(
            image: kOnBoardingImage3,
            title: kOnboardingTitle3,
            subTitle: kOnboardingSubTitle3,
            counterText: kOnboardingCounter3,
            bgColor: kOnBoardingPage3Color
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios_new),
            enableSideReveal: true,
            liquidController: LiquidController(),
            onPageChangeCallback: (index) => controller.onPageChanged(index),
          ),
           Obx(
             ()=> Visibility(
               visible: controller.currentPage.value == 2,
               child: Positioned(
                 bottom: 55.0,
                 child: OutlinedButton(
                   onPressed: () => Navigator.pushReplacementNamed(context, Routes.principal),
                   style: ElevatedButton.styleFrom(
                       side: const BorderSide(color: kDarkColor),
                       shape: const CircleBorder(),
                       padding: const EdgeInsets.all(20.0)
                   ),
                   child: Container(
                     padding: const EdgeInsets.all(20.0),
                     decoration: const BoxDecoration(
                         color: kDeepDarkColor,
                         shape: BoxShape.circle
                     ),
                     child: const Icon(Icons.arrow_forward_ios),
                   ),
                 ),
               ),
             ),
           ),
           Obx(
                 ()=> Positioned(
              bottom: 25,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: kDeepDarkColor,
                  dotHeight: 4.0
                ),
              ),
          ),
           )
        ],
      ),
    );
  }
}
