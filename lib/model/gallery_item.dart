import 'package:p_16_gallery_app/gen/assets.gen.dart';

class GalleryItem {
  GalleryItem({
    required this.imageTitle,
    required this.imageDate,
    required this.imageDescription,
    required this.imagePath,
  });

  final String imageTitle;
  final String imageDate;
  final String imageDescription;
  final AssetGenImage imagePath;
}
