import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/model/gallery_item.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_details.dart';

class GalleryItemCard extends StatelessWidget {
  const GalleryItemCard({
    super.key,
    required this.image,
    required this.onShowDetails,
  });

  final GalleryItem image;
  final VoidCallback onShowDetails;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        onShowDetails();
        showBottomSheet(
          context: context,
          builder: (context) => GalleryItemDetails(item: image),
        ).closed.then((_) {
          onShowDetails();
        });
      },
      child: Card(
        elevation: isDarkMode ? 0 : 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: image.imagePath.image(
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
        ),
      ),
    );
  }
}
