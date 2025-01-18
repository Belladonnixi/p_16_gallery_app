import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';

class GalleryItemCard extends StatelessWidget {
  const GalleryItemCard({
    super.key,
    required this.image,
    required this.onTapNavigate,
  });

  final GalleryItem image;
  final VoidCallback? onTapNavigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapNavigate,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Ich berechne die Höhe des Bildes dynamisch basierend auf der maximal verfügbaren Breite (`constraints.maxWidth`).
            // Der `LayoutBuilder` liefert die Größe des übergeordneten Containers, in dem die `GalleryItemCard` gerendert wird.
            // - `constraints.maxWidth`: Gibt die verfügbare Breite der Karte zurück (z. B. in einer GridView oder ListView).
            // - `0.75`: Dieser Faktor legt fest, dass die Höhe des Bildes 75% der verfügbaren Breite betragen soll.
            //   Das sorgt für ein ausgewogenes Verhältnis zwischen Breite und Höhe, das gut aussieht.
            final imageHeight = constraints.maxWidth * 0.8;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Dynamische Höhe für das Bild
                SizedBox(
                  height: imageHeight,
                  child: image.imagePath.image(
                    fit: BoxFit.cover,
                  ),
                ),
                // Titelbereich
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    image.imageTitle,
                    style: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            )
                        : Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
