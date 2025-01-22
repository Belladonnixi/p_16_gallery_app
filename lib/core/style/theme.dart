import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/style/colors.dart';

ThemeData getLightTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NatureThemeColors.skyBlueLight,
        brightness: Brightness.light,
        primary: NatureThemeColors.skyBlueLight,
        primaryContainer: NatureThemeColors.mistyBlueLight,
        secondary: NatureThemeColors.forestGreenLight,
        secondaryContainer: NatureThemeColors.softSandLight,
        tertiary: NatureThemeColors.rusticRedLight,
        tertiaryContainer: NatureThemeColors.paleStoneLight,
        surface: NatureThemeColors.cloudyWhiteLight,
      ),
      scaffoldBackgroundColor: NatureThemeColors.naturalCanvasLight,
      appBarTheme: AppBarTheme(
        backgroundColor:
            NatureThemeColors.skyBlueLight.withAlpha(((0.95 * 255).toInt())),
        elevation: 1,
        shadowColor:
            NatureThemeColors.skyBlueLight.withAlpha(((0.5 * 255).toInt())),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: NatureThemeColors.cloudyWhiteLight,
        selectedItemColor: NatureThemeColors.skyBlueLight,
        unselectedItemColor:
            NatureThemeColors.skyBlueLight.withAlpha(((0.6 * 255).toInt())),
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
      ),
      iconTheme: const IconThemeData(
        color: NatureThemeColors.skyBlueLight,
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
          backgroundColor: NatureThemeColors.mistyBlueLight,
          foregroundColor: NatureThemeColors.skyBlueLight,
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
      cardTheme: CardTheme(
        elevation: 2,
        color: NatureThemeColors.cloudyWhiteLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

ThemeData getDarkTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NatureThemeColors.twilightBlueDark,
        brightness: Brightness.dark,
        primary: NatureThemeColors.twilightBlueDark,
        primaryContainer: NatureThemeColors.midnightBlueDark,
        secondary: NatureThemeColors.mossGreenDark,
        secondaryContainer: NatureThemeColors.deepForestDark,
        tertiary: NatureThemeColors.mutedRoseDark,
        tertiaryContainer: NatureThemeColors.slateGrayDark,
        surface: NatureThemeColors.charcoalDark,
        onSurface: Colors.grey[300],
      ),
      scaffoldBackgroundColor: NatureThemeColors.shadowCanvasDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: NatureThemeColors.evergreenDark,
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
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey[300]),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey[400]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NatureThemeColors.deepForestDark,
          foregroundColor: NatureThemeColors.mossGreenDark,
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
      cardTheme: CardTheme(
        elevation: 0,
        color: NatureThemeColors.charcoalDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
