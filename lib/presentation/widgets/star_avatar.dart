import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/core/utils/star_clipper.dart';

class StarAvatar extends StatelessWidget {
  final String imagePath;
  final double size;

  const StarAvatar({
    super.key,
    required this.imagePath,
    this.size = 100.0, // Standardgröße für das Bild
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // Hier schneide ich das Bild so zu, dass es die Form eines Sterns hat.
      // Dafür nutze ich den StarClipper, der die Sternform definiert.
      clipper: StarClipper(5), // 5 Ecken für den Stern
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill, // Ich lasse das Bild den verfügbaren Platz ausfüllen.
        width: size, // Breite des Bildes
        height: size, // Höhe des Bildes
      ),
    );
  }
}
