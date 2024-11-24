import 'package:flutter/widgets.dart';

class NitroScreenSize {
  static const double xtraSmall = 300;
  static const double small = 600;
  static const double medium = 1024;
  static const double large = 1440;

  static NitroScreenCategory getCategory(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < xtraSmall) {
      return NitroScreenCategory.xtraSmall;
    } else if (width < small) {
      return NitroScreenCategory.small;
    } else if (width < medium) {
      return NitroScreenCategory.medium;
    } else if (width < large) {
      return NitroScreenCategory.large;
    } else {
      return NitroScreenCategory.extraLarge;
    }
  }
}

enum NitroScreenCategory { xtraSmall, small, medium, large, extraLarge }
