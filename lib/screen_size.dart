import 'package:flutter/material.dart';
import 'package:yardapp/app_defaults.dart';


double resizeToScreenWidth(BuildContext context, double width) {
  double sizeWidth = MediaQuery.of(context).size.width;
  // printWhenDebug("------");
  // printWhenDebug("screenWidthStandard: $screenWidthStandard");
  // printWhenDebug("sizeWidth: $sizeWidth");
  // printWhenDebug("/");
  double sizeWidthNewTemp1 = (sizeWidth / screenWidthStandard);
  // printWhenDebug("sizeWidthNewTemp1: $sizeWidthNewTemp1");
  // printWhenDebug("*");
  // printWhenDebug("width: $width");
  double sizeWidthNewTemp2 = sizeWidthNewTemp1 * width;
  // printWhenDebug("sizeWidthNewTemp2: $sizeWidthNewTemp2");
  // double sizeWidthNew = (sizeWidth / screenWidthStandard) * width;
  return sizeWidthNewTemp2;
}

double resizeToScreenHeight(BuildContext context, double height) {
  double sizeHeight = MediaQuery.of(context).size.height;
  // printWhenDebug("screenHeightStandard: $screenHeightStandard");
  // printWhenDebug("sizeHeight: $sizeHeight");
  // printWhenDebug("/");
  double sizeHeightNewTemp1 = (sizeHeight / screenHeightStandard);
  // printWhenDebug("sizeHeightNewTemp1: $sizeHeightNewTemp1");
  if (sizeHeightNewTemp1 > 1.25) {
    sizeHeightNewTemp1 = 1.25;
  }
  // printWhenDebug("*");
  // printWhenDebug("Height: $height");
  double sizeHeightNewTemp2 = sizeHeightNewTemp1 * height;
  // printWhenDebug("sizeHeightNewTemp2: $sizeHeightNewTemp2");
  // double sizeHeightNew = (sizeHeight / screenHeightStandard) * height;
  return sizeHeightNewTemp2;
}
