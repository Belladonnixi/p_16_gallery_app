import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/gallery_data.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_card.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _appBarTitle = 'MyGallery';

  void _toggleAppBarTitle() {
    setState(() {
      _appBarTitle = _appBarTitle == 'MyGallery' ? 'Details' : 'MyGallery';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
        ),
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
          return GalleryItemCard(
            image: image,
            onShowDetails: _toggleAppBarTitle,
          );
        },
      ),
    );
  }
}
