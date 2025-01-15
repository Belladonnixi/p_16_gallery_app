import 'dart:ui';
import 'package:flex_color_scheme/flex_color_scheme.dart';

const FlexSchemeData natureTheme = FlexSchemeData(
  name: 'Alpine Nature',
  description: 'Nature-inspired theme with alpine colors and earthy tones',
  light: FlexSchemeColor(
    // Bergseeblau - Hauptfarbe für Überschriften und wichtige Elemente
    primary: Color.fromARGB(255, 45, 96, 115),
    // Helles Nebelgrau - für Container und Hintergründe
    primaryContainer: Color.fromARGB(255, 230, 238, 242),
    // Warmes Waldgrün - für Akzente und Buttons
    secondary: Color.fromARGB(255, 56, 102, 65),
    // Helles Sandbeige - für Container und Karten
    secondaryContainer: Color.fromARGB(255, 242, 232, 220),
    // Gedämpftes Alpenrot - für Hervorhebungen
    tertiary: Color.fromARGB(255, 142, 74, 73),
    // Helles Wolkengrau - für zusätzliche Container
    tertiaryContainer: Color.fromARGB(255, 245, 245, 245),
  ),
  dark: FlexSchemeColor(
    // Helles Bergseeblau - für Texte und Überschriften
    primary: Color.fromARGB(255, 137, 184, 201),
    // Dunkles Bergseeblau - für Container
    primaryContainer: Color.fromARGB(255, 26, 69, 84),
    // Helles Waldgrün - für Akzente
    secondary: Color.fromARGB(255, 122, 184, 146),
    // Dunkles Waldgrün - für Container
    secondaryContainer: Color.fromARGB(255, 37, 78, 48),
    // Sanftes Alpenglühen - für Hervorhebungen
    tertiary: Color.fromARGB(255, 209, 169, 168),
    // Dunkles Gesteinsgrau - für zusätzliche Container
    tertiaryContainer: Color.fromARGB(255, 42, 45, 62),
  ),
);
