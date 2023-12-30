import 'package:flutter/material.dart';

import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: LightThemeColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: LightThemeColors.accentColor,
        backgroundColor: LightThemeColors.backgroundColor,
        brightness: Brightness.light,
      ).copyWith(
        secondary: LightThemeColors.accentColor,
      ),
      // color contrast (if the theme is dark text should be white for example)
      brightness: Brightness.light,
      // card widget background color
      cardColor: LightThemeColors.cardColor,
      // hint text color
      hintColor: LightThemeColors.hintTextColor,
      // divider color
      dividerTheme: const DividerThemeData(
        color: LightThemeColors.dividerColor,
      ),
      // app background color
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,

      // progress bar theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: LightThemeColors.primaryColor,
      ),

      // appBar theme
      appBarTheme: MyStyles.getAppBarTheme(),

      // elevated button theme
      elevatedButtonTheme: MyStyles.getElevatedButtonTheme(),

      // text theme
      textTheme: MyStyles.getTextTheme(),

      // chip theme
      chipTheme: MyStyles.getChipTheme(),

      // icon theme
      iconTheme: MyStyles.getIconTheme(),
    );
  }
}
