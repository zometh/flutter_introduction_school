import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:introduction/common/utils.dart';

class SizeConfig {
  //Ref: Iphone X/Xs screen dimensions
  static const double DESIGN_WIDTH = 375.0;
  static const double DESIGN_HEIGTH = 812.0;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeigtht;
  static late double pixelRatio;
  static late Orientation orientation;
  static bool isTablet = false;
  static bool isDarkMode = false;
  /*
  Cache pour stocker les calculs de pourcentages
  Ces maps nous évitent de calculer les mems
  pourcentages plusieurs fois
   */
  static final Map<int, double> _widthPercentages = {};
  static final Map<int, double> _heigthPercentages = {};

  static void init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeigtht = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    isDarkMode = _mediaQueryData.platformBrightness == Brightness.dark;
    isTablet = await Utils.isTablet(context);

  }

  static double getProportionateScreenHeigth(double inputHeigth) {
    return (inputHeigth / DESIGN_HEIGTH) * screenHeigtht;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / DESIGN_WIDTH) * screenWidth;
  }
}
