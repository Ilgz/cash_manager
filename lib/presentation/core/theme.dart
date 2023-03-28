// Dark mode
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:flutter/material.dart';
// Light mode
final lightTheme = ThemeData(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black,

  primaryColor: AppColorConstants.lightPrimaryColor,
  scaffoldBackgroundColor: AppColorConstants.lightScaffoldBackgroundColor,
  textTheme: TextTheme(
    caption: TextStyle(
      fontSize: 14,
      color: Colors.grey.shade600,
    ),

  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(

          fixedSize: MaterialStateProperty.all(const Size(180, 40)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
              AppColorConstants.lightPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )))),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.lightPrimaryColor),
);

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColorConstants.darkPrimaryColor,
    dividerColor: Colors.white70,
    textTheme: TextTheme(
      caption: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade300,
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: AppColorConstants.darkScaffoldBackgroundColor,
    floatingActionButtonTheme:
    const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(180, 40)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColorConstants.darkPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )))));
