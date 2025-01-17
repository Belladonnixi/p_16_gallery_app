import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/style/theme.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/splash_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/tabs_screen.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_details.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case '/':
              return const SplashScreen();
            case '/tabs':
              return const TabsScreen();
            case '/gallery':
              return const GalleryScreen();
            case '/about_me':
              return const AboutMeScreen();
            case '/details':
              final item = settings.arguments as GalleryItem;
              return GalleryItemDetails(
                item: item,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
