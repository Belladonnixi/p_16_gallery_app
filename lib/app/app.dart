import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/style/theme.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/splash_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/tabs_screen.dart';

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
      routes: {
        '/': (context) => const SplashScreen(),
        '/tabs': (context) => const TabsScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/about': (context) => const AboutMeScreen(),
      },
    );
  }
}
