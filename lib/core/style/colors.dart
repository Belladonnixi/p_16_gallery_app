import 'package:flutter/material.dart';

abstract class NatureThemeColors {
  // Light Theme Colors
  static const Color primaryLight = Color.fromARGB(255, 45, 96, 115);
  static const Color primaryContainerLight = Color.fromARGB(255, 230, 238, 242);
  static const Color secondaryLight = Color.fromARGB(255, 56, 102, 65);
  static const Color secondaryContainerLight =
      Color.fromARGB(255, 242, 232, 220);
  static const Color tertiaryLight = Color.fromARGB(255, 142, 74, 73);
  static const Color tertiaryContainerLight =
      Color.fromARGB(255, 245, 245, 245);
  static const Color appBarColorLight = Color.fromARGB(255, 75, 101, 111);
  static const Color surfaceLight = Color.fromARGB(255, 245, 245, 240);
  static const Color scaffoldBackgroundLight =
      Color.fromARGB(255, 250, 250, 245);

  // Dark Theme Colors
  static const Color primaryDark = Color.fromARGB(255, 137, 184, 201);
  static const Color primaryContainerDark = Color.fromARGB(255, 26, 69, 84);
  static const Color secondaryDark = Color.fromARGB(255, 122, 184, 146);
  static const Color secondaryContainerDark =
      Color.fromARGB(255, 50, 60, 50); // Dezent dunkler Grün-Ton
  static const Color tertiaryDark = Color.fromARGB(255, 209, 169, 168);
  static const Color tertiaryContainerDark =
      Color.fromARGB(255, 60, 60, 70); // Sanfter dunkler Blau-Grau-Ton
  static const Color appBarColorDark = Color.fromARGB(255, 37, 78, 48);
  static const Color surfaceDark =
      Color.fromARGB(255, 35, 35, 40); // Dezent dunkler für Oberflächen
  static const Color scaffoldBackgroundDark = Color.fromARGB(255, 18, 18, 20);
}
