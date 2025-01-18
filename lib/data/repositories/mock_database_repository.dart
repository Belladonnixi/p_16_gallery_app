import 'package:p_16_gallery_app/data/data_source/gallery_data.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/data/repositories/database_repository.dart';
import 'dart:io';

// Enum für verschiedene Fehlerarten
// auch bei automatisierten Unit-Tests kann man so den Fehler setzen
enum MockErrorType { none, emptyData, networkError, unknownError }

class MockDatabaseRepository implements DatabaseRepository {
  MockDatabaseRepository._internal();

  static final MockDatabaseRepository _instance =
      MockDatabaseRepository._internal();

  // hierüber schaffe ich im Konstruktor die Möglichkeit, den Fehler zu setzen um es testen zu können
  // egal ob manuell oder automatisiert
  factory MockDatabaseRepository(
      {MockErrorType errorType = MockErrorType.none}) {
    _instance.errorType = errorType;
    return _instance;
  }

  MockErrorType errorType = MockErrorType.none;

  // Set statt List, da es keine doppelten Elemente enthalten kann
  // Dart Dokumentation: https://api.dart.dev/stable/2.14.4/dart-core/Set-class.html
  final Set<GalleryItem> _favorites = {};

  @override
  Future<List<GalleryItem>> getGalleryItems() async {
    // künstliche Verzögerung um Ladeanimation zu zeigen
    await Future.delayed(const Duration(milliseconds: 500));
    // je nach Fehlerart wird ein Fehler geworfen oder die Daten zurückgegeben
    switch (errorType) {
      case MockErrorType.none:
        return galleryData;
      case MockErrorType.emptyData:
        return [];
      case MockErrorType.networkError:
        throw const SocketException(
            'Netzwerkfehler: Verbindung fehlgeschlagen');
      case MockErrorType.unknownError:
        throw Exception('Ein unbekannter Fehler ist aufgetreten');
    }
  }

  @override
  Future<void> addFavorite(GalleryItem item) async {
    await Future.delayed(const Duration(milliseconds: 100)); // Optional
    _favorites.add(item);
  }

  @override
  Future<void> removeFavorite(GalleryItem item) async {
    await Future.delayed(const Duration(milliseconds: 100)); // Optional
    _favorites.remove(item);
  }

  @override
  Future<List<GalleryItem>> getFavorites() async {
    await Future.delayed(const Duration(milliseconds: 200)); // Optional
    return _favorites.toList();
  }
}
