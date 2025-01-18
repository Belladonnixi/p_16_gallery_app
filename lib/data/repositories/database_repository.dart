import 'package:p_16_gallery_app/data/model/gallery_item.dart';

abstract class DatabaseRepository {
  Future<List<GalleryItem>> getGalleryItems();
  Future<void> addFavorite(GalleryItem item);
  Future<void> removeFavorite(GalleryItem item);
  Future<List<GalleryItem>> getFavorites();
}
