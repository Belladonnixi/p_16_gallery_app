import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/favorite_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/splash_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/tabs_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_item_details_screen.dart';
import 'package:p_16_gallery_app/routes/not_found.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPageRoute(const SplashScreen(), settings);
      case '/tabs':
        return _buildPageRoute(const TabsScreen(), settings);
      case '/gallery':
        return _buildPageRoute(const GalleryScreen(), settings);
      case '/about_me':
        return _buildPageRoute(const AboutMeScreen(), settings);
      case '/details':
        final item = settings.arguments as GalleryItem;
        return _buildDetailsPageRoute(
            GalleryItemDetailsScreen(item: item), settings);
      case '/favorite':
        return _buildPageRoute(const FavoritesScreen(), settings);
      default:
        return _buildPageRoute(const NotFoundScreen(), settings);
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _buildDetailsPageRoute(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
