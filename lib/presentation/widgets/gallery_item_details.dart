import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/model/gallery_item.dart';

class GalleryItemDetails extends StatelessWidget {
  const GalleryItemDetails({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: screenHeight * 2 / 3,
                    child: item.imagePath.image(
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.imageTitle,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.imageDate,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            item.imageDescription,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Schließen'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
