import 'package:p_16_gallery_app/data/data_source/gallery_data.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/data/repositories/database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  MockDatabaseRepository._internal();

  static final MockDatabaseRepository _instance =
      MockDatabaseRepository._internal();

  factory MockDatabaseRepository() => _instance;

  @override
  Future<List<GalleryItem>> getGalleryItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return galleryData;
  }
}
