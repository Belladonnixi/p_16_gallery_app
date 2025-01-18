import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/widgets/favorite_row.dart';

class GalleryItemDetailsScreen extends StatelessWidget {
  const GalleryItemDetailsScreen({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    // so ermmittle ich die Höhe des Bildschirms
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.imageTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bildbereich: Ich nutze eine ConstrainedBox, um sicherzustellen, dass das Bild
            // nicht zu groß wird und den Bildschirm dominiert. Ich begrenze die maximale
            // Höhe des Bildes auf 60 % der Bildschirmhöhe (3/5). Dadurch bleibt genug Platz
            // für den restlichen Inhalt darunter sichtbar.
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: screenHeight *
                    3 /
                    5, // Maximal 60 % der Gesamthöhe des Bildschirms
              ),
              // Auf das Bild greife ich direkt über den Flutter gen ImageProvider zu.
              child: item.imagePath.image(
                // Ich lasse das Bild den gesamten Platz füllen.
                fit: BoxFit.cover,
                // Das Bild wird über die gesamte Breite des Containers angezeigt.
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Favoriten-Row
                  FavoriteDetailsTitleRow(item: item),
                  const SizedBox(height: 16),
                  // Beschreibung
                  Text(
                    item.imageDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Schließen'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
