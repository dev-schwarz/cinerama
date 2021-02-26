import 'package:flutter/material.dart';

class AppConstants {
  const AppConstants._();

  static const double tmdbProfileAspectRatio = 0.666666667;
  static const double tmdbPosterAspectRatio = 0.666666667;
  static const double tmdbBackdropAspectRatio = 1.777777778;

  static const double appAppBarTitleSpacing = 8.0;

  static const Color appScaffoldBackgroundColorLight = const Color(0xffeeeeee);
  static const Color appScaffoldBackgroundColorDark = const Color(0xff303030);

  static const Color appLoadingIndicatorColor = const Color(0xffbdbdbd);

  static const EdgeInsets appListViewPadding = const EdgeInsets.all(4.0);

  static const double appAlternativeMediaIconSize = 40.0;

  static const double appPersonCardHeight = 220.0;

  static const int appPersonCardGridMaxItems = 20;

  static const int appDataFetchDelayInMilliseconds = 500;

  static const Widget appListViewDivider = const Divider(
    color: const Color(0xffbdbdbd),
    height: 0.0,
  );

  static const Map<String, int> appPersonDepartmentOrder = const <String, int>{
    'Directing': 100,
    'Writing': 90,
    'Production': 80,
  };
}
