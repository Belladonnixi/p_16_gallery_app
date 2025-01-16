import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/data/repositories/database_repository.dart';
import 'package:p_16_gallery_app/data/repositories/mock_database_repository.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_card.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _appBarTitle = 'MyGallery';
  late final DatabaseRepository _repository;
  late Future<List<GalleryItem>> _galleryData;

  @override
  void initState() {
    super.initState();
    _repository = MockDatabaseRepository();
    _galleryData = _repository.getGalleryItems();
  }

  void _toggleAppBarTitle() {
    setState(() {
      _appBarTitle = _appBarTitle == 'MyGallery' ? 'Details' : 'MyGallery';
    });
  }

  Future<void> _reloadData() async {
    setState(() {
      _galleryData = _repository.getGalleryItems();
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
      body: FutureBuilder(
        future: _galleryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load gallery data.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          } else {
            final galleryData = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _reloadData,
              child: GridView.builder(
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
        },
      ),
    );
  }
}
