import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/style/colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NatureThemeColors.primaryLight,
      brightness: Brightness.light,
      primary: NatureThemeColors.primaryLight,
      primaryContainer: NatureThemeColors.primaryContainerLight,
      secondary: NatureThemeColors.secondaryLight,
      secondaryContainer: NatureThemeColors.secondaryContainerLight,
      tertiary: NatureThemeColors.tertiaryLight,
      tertiaryContainer: NatureThemeColors.tertiaryContainerLight,
      surface: NatureThemeColors.surfaceLight,
    ),
    scaffoldBackgroundColor: NatureThemeColors.scaffoldBackgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor:
          NatureThemeColors.primaryLight.withAlpha(((0.95 * 255).toInt())),
      elevation: 1,
      shadowColor:
          NatureThemeColors.primaryLight.withAlpha(((0.5 * 255).toInt())),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: NatureThemeColors.surfaceLight,
      selectedItemColor: NatureThemeColors.primaryLight,
      unselectedItemColor:
          NatureThemeColors.primaryLight.withAlpha(((0.6 * 255).toInt())),
      selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
    ),
    iconTheme: const IconThemeData(
      color: NatureThemeColors.primaryLight,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
      bodyLarge:
          TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: NatureThemeColors.primaryContainerLight,
        foregroundColor: NatureThemeColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: NatureThemeColors.primaryDark,
      brightness: Brightness.dark,
      primary: NatureThemeColors.primaryDark,
      primaryContainer: NatureThemeColors.primaryContainerDark,
      secondary: NatureThemeColors.secondaryDark,
      secondaryContainer: NatureThemeColors.secondaryContainerDark,
      tertiary: NatureThemeColors.tertiaryDark,
      tertiaryContainer: NatureThemeColors.tertiaryContainerDark,
      surface: NatureThemeColors.surfaceDark,
      onSurface: Colors.grey[300], // Text auf Oberflächen
    ),
    scaffoldBackgroundColor: NatureThemeColors.scaffoldBackgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: NatureThemeColors.appBarColorDark,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[300],
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey[300]),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey[400]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            NatureThemeColors.secondaryContainerDark, // Dezent dunkler Button
        foregroundColor: NatureThemeColors.secondaryDark, // Textfarbe
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
