import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:introduction/common/size_config.dart';

import 'dart:math' as math;

class Utils {
  static const double TABLET_BREAKPOINT = 600.0;
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static bool isPortrait(BuildContext context) {
    return SizeConfig.orientation == Orientation.portrait;
  }

  static Future<bool> isTablet(BuildContext context) async {
    try {
      if (Platform.isIOS) return _isIosTablet();
      if (Platform.isAndroid) return _isAndroidTablet(context);
      return _isTabletByScreenSize(context);
    } catch (e) {
      debugPrint(e.toString());
      return _isTabletByScreenSize(context);
    }
  }

  static Future<bool> _isAndroidTablet(BuildContext context) async {
    //screen_width > 600 , architecture X64, screen > 7pouces
    final androidInfos = await _deviceInfoPlugin.androidInfo;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.width;
    double diagonalInches =
        _calculateScreenDiagonal(screenWidth, screenHeigth, context);
    bool hasTabletcaracteristics =
        androidInfos.supported64BitAbis.isNotEmpty ?? false;
    return hasTabletcaracteristics &&
        diagonalInches > 7 &&
        _isTabletByScreenSize(context);
  }

  static Future<bool> _isIosTablet() async {
    final iosInfos = await _deviceInfoPlugin.iosInfo;
    return iosInfos.model.contains("ipad");
  }

  static double _calculateScreenDiagonal(
      double width, double heigth, BuildContext context) {
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    var physicalWidth = width * pixelRatio;
    var physicalHeigtht = width * pixelRatio;
    var diagonalPixels = _pythagoras(physicalWidth, physicalHeigtht);
    return diagonalPixels / (160 * pixelRatio);
  }

  static double _pythagoras(double width, double heigth) {
    return math.sqrt(width * width + heigth * heigth);
  }

  static bool _isTabletByScreenSize(BuildContext context) {
    final shortestSize = MediaQuery.of(context).size.shortestSide;
    return shortestSize >= 600;
  }
}
