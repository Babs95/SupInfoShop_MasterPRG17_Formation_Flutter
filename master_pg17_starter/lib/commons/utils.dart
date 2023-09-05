import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_pg17_starter/commons/size_config.dart';

class Utils{
  static bool isPortrait(BuildContext context) {
    return SizeConfig.orientation == Orientation.portrait;
  }

  static Future<bool> isTablet(BuildContext context) async {
    if(Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfos = await deviceInfo.iosInfo;
      return iosInfos.model?.toLowerCase() == "ipad";
    }else {
      var shortestSide = MediaQuery.of(context).size.shortestSide;
      return shortestSide > 600;
    }
  }
}