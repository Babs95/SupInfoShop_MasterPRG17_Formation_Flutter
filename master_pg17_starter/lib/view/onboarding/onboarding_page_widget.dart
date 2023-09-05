import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_pg17_starter/model/onboarding_model.dart';

import '../../commons/constant_assets.dart';
import '../../commons/constant_color.dart';
import '../../commons/constatnt_string.dart';
import '../../commons/size_config.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key, required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: SizeConfig.screenHeight30,),
          Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: SizeConfig.isTablet ? 32 : 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 25,),
              Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: kTextColor,
                        fontSize: SizeConfig.isTablet ? 20 : 15,
                        fontWeight: FontWeight.bold
                    ),
                  )
              )
            ],
          ),
          Text(
            model.counterText,
            style: TextStyle(
                fontSize: SizeConfig.isTablet ? 25 : 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}