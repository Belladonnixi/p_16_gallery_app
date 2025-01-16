import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';

class GalleryItemDetails extends StatelessWidget {
  const GalleryItemDetails({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 3 / 5,
              ),
              child: item.imagePath.image(
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Inhaltsbereich
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.imageTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.imageDate,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.imageDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Align(
              alignment: Alignment.center,
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
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
