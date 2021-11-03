import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xff303f9f);
  static const Color _primaryColorLight = Color(0xff666ad1);
  static const Color _primaryColorDark = Color(0xff001970);

  static ThemeData get themeData {
    return themeDataLight;
  }

  static final ThemeData themeDataLight = ThemeData(
    primaryColor: _primaryColor,
    primaryColorBrightness: Brightness.light,
    primaryColorLight: _primaryColorLight,
    primaryColorDark: _primaryColorDark,
    primaryTextTheme: Typography.whiteCupertino,
    textTheme: Typography.blackCupertino,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: _primaryColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
    ),
    buttonBarTheme: const ButtonBarThemeData(
      alignment: MainAxisAlignment.center,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: _primaryColor,
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      color: _primaryColor,
      borderColor: _primaryColorLight,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _primaryColor,
      behavior: SnackBarBehavior.floating,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: _primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: _primaryColor,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
      textColor: Colors.black,
      contentPadding: EdgeInsets.all(1.0),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
    ),
  );
}
