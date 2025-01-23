import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/style/theme.dart';
import 'package:p_16_gallery_app/routes/routes.dart';

/// Warum globale Navigation?
/// - **Zentrale Verwaltung**: Die Navigation wird in der gesamten App konsistent gehalten.
/// - **Flexibilität**: Named Routes können von jedem Bildschirm aus verwendet werden.
/// - **Erweiterbarkeit**: Neue Routen können einfach hinzugefügt werden, ohne an mehreren Stellen Änderungen vornehmen zu müssen.
///
/// Unterschied zur lokalen Navigation:
/// - Globale Navigation: Die Routen sind in der gesamten App gültig und zentral im `RouteGenerator` definiert.
/// - Lokale Navigation: Die Navigation ist auf einen spezifischen Bereich (z. B. TabsScreen) beschränkt.
///   Dies ist sinnvoll für Sub-Navigation, wenn die Routen nur innerhalb eines Bildschirms benötigt werden.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Entfernt das Debug-Banner in der oberen rechten Ecke
      theme: getLightTheme(), // Definiert das helle Theme der App
      darkTheme: getDarkTheme(), // Definiert das dunkle Theme der App
      themeMode: ThemeMode
          .system, // Wählt das Theme basierend auf den Systemeinstellungen
      initialRoute: '/', // Die Startseite der App (wird zuerst angezeigt)
      onGenerateRoute: RouteGenerator.generateRoute,
      /**
       * onGenerateRoute:
       * Diese Methode verwendet den `RouteGenerator`, um die richtige Seite basierend auf dem Namen der Route anzuzeigen.
       * Alle Routen werden zentral verwaltet, was die Navigation übersichtlich und leicht wartbar macht.
       * Und hier auch zwingend erforderlich wegen dem SplashScreen.
       */
    );
  }
}
