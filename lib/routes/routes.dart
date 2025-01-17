import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/splash_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/tabs_screen.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_details.dart';
import 'package:p_16_gallery_app/routes/not_found.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/tabs':
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case '/gallery':
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case '/about_me':
        return MaterialPageRoute(builder: (_) => const AboutMeScreen());
      case '/details':
        final item = settings.arguments as GalleryItem;
        return MaterialPageRoute(
          builder: (_) => GalleryItemDetails(item: item),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
