import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/favorite_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/splash_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/tabs_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_item_details_screen.dart';
import 'package:p_16_gallery_app/routes/not_found.dart';

/// RouteGenerator
///
/// Was ist das?
/// Der RouteGenerator verwaltet die Navigation innerhalb der App. Statt jede Navigation direkt im Code zu schreiben,
/// verwenden wir **Named Routes**, um zentral zu steuern, welche Seite angezeigt werden soll und wie der Übergang animiert wird.
///
/// Vorteile von Named Routes:
/// - Übersichtlicher Code: Navigation wird zentral definiert.
/// - Flexibilität: Übergangsanimationen und Sonderfälle (z. B. Übergabe von Daten) können an einer Stelle verwaltet werden.
///
/// Dieser Generator behandelt zwei Arten von Übergängen:
/// - **Standard SlideTransition**: Seiten sliden von rechts nach links in den Bildschirm.
/// - **Details Transition**: Eine spezielle Transition für Detailseiten, bei der die Seite von unten nach oben in den Bildschirm slidet.
class RouteGenerator {
  /// generateRoute
  ///
  /// Diese Methode wird immer aufgerufen, wenn eine benannte Route verwendet wird (`Navigator.pushNamed`).
  /// Sie entscheidet, welche Seite basierend auf dem Namen der Route angezeigt wird.
  ///
  /// @param settings - Enthält Informationen zur Route, wie den Namen und übergebene Argumente.
  /// @return Eine Route mit der entsprechenden Seite und Animation.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // Startseite (SplashScreen)
        return _buildPageRoute(const SplashScreen(), settings);
      case '/tabs':
        // Tabs-Screen, z. B. für eine Bottom Navigation
        return _buildPageRoute(const TabsScreen(), settings);
      case '/gallery':
        // Galerie-Screen, z. B. zum Anzeigen von Bildern
        return _buildPageRoute(const GalleryScreen(), settings);
      case '/about_me':
        // "Über mich"-Seite
        return _buildPageRoute(const AboutMeScreen(), settings);
      case '/details':
        // Detailseite: Übergibt ein "GalleryItem" (z. B. Bilddetails)
        final item = settings.arguments as GalleryItem;
        return _buildDetailsPageRoute(
            GalleryItemDetailsScreen(item: item), settings);
      case '/favorite':
        // Favoriten-Seite
        return _buildPageRoute(const FavoritesScreen(), settings);
      default:
        // Fehlerseite für unbekannte Routen
        return _buildPageRoute(const NotFoundScreen(), settings);
    }
  }

  /// _buildPageRoute
  ///
  /// Erstellt eine Route mit einer **Standard-Animation** (Slide von rechts nach links).
  ///
  /// @param page - Das Widget (die Seite), die angezeigt werden soll.
  /// @param settings - Route-Einstellungen (z. B. Name oder übergebene Daten).
  /// @return Eine PageRouteBuilder-Instanz mit Standard-Animation.
  static PageRouteBuilder _buildPageRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings, // Übergibt Route-Informationen
      pageBuilder: (context, animation, secondaryAnimation) => page,
      /**
       * transitionsBuilder
       *
       * Steuert, wie der Übergang animiert wird.
       * Animation: Die Seite slidet von rechts nach links in den Bildschirm.
       *
       * @param animation - Steuert den Übergang zwischen den Seiten.
       * @param child - Das Ziel-Widget (die neue Seite).
       */
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Animation startet rechts außerhalb des Bildschirms
        const begin = Offset(1.0, 0.0);
        // Animation endet in der Mitte des Bildschirms
        const end = Offset.zero;
        // Animationskurve: Sanft ein- und ausblenden
        const curve = Curves.ease;

        // Animation wird als Kombination aus Offset und Kurve erstellt
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // SlideTransition: Bewegt die Seite basierend auf der Animation
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  /// _buildDetailsPageRoute
  ///
  /// Erstellt eine Route mit einer **spezialisierten Animation** für Detailseiten.
  /// Animation: Die Seite slidet von unten nach oben in den Bildschirm.
  ///
  /// @param page - Das Widget (die Detailseite), die angezeigt werden soll.
  /// @param settings - Route-Einstellungen (z. B. Name oder übergebene Daten).
  /// @return Eine PageRouteBuilder-Instanz mit spezieller Animation.
  static PageRouteBuilder _buildDetailsPageRoute(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings, // Übergibt Route-Informationen
      pageBuilder: (context, animation, secondaryAnimation) => page,
      /**
       * transitionsBuilder
       *
       * Steuert, wie der Übergang zu Detailseiten animiert wird.
       * Animation: Die Seite slidet von unten nach oben in den Bildschirm.
       *
       * @param animation - Steuert den Übergang zwischen den Seiten.
       * @param child - Das Ziel-Widget (die neue Seite).
       */
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Animation startet unterhalb des Bildschirms
        const begin = Offset(0.0, 1.0);
        // Animation endet in der Mitte des Bildschirms
        const end = Offset.zero;
        // Animationskurve: Sanft ein- und ausblenden
        const curve = Curves.easeInOut;

        // Animation wird als Kombination aus Offset und Kurve erstellt
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // SlideTransition: Bewegt die Seite basierend auf der Animation
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
