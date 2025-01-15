import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_16_gallery_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 10, 91, 111),
        ),
        textTheme: GoogleFonts.urbanistTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
