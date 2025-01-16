import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToTabs() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/tabs');
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToTabs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.logo.galleryAppLogo.image(width: 250),
            const SizedBox(height: 54),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
