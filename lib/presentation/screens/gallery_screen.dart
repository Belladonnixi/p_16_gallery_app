import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/gallery_data.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_card.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyGallery',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final image = galleryData[index];
          return GalleryItemCard(image: image);
        },
      ),
    );
  }
}
