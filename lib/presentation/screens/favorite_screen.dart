import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/data/repositories/mock_database_repository.dart';
import 'package:p_16_gallery_app/presentation/widgets/empty_favorites_content.dart';
import 'package:p_16_gallery_app/presentation/widgets/gallery_item_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final MockDatabaseRepository repository = MockDatabaseRepository();
  late Future<List<GalleryItem>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    // Favoritenliste neu laden und aktualisieren
    setState(() {
      _favoritesFuture = repository.getFavorites();
    });
  }

  Future<void> _navigateToDetails(GalleryItem item) async {
    // Navigiere zur Details-Seite und warte, bis die Seite geschlossen wird
    await Navigator.pushNamed(
      context,
      '/details',
      arguments: item,
    );

    // Nach Rückkehr von der Details-Seite Favoriten neu laden
    _loadFavorites();
  }

  Future<void> _removeFavorite(GalleryItem item) async {
    await repository.removeFavorite(item); // Favorit löschen
    _loadFavorites(); // Favoriten neu laden
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: FutureBuilder<List<GalleryItem>>(
        future: _favoritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Ladeanimation anzeigen, während die Favoriten geladen werden
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Fehleranzeige, wenn beim Laden etwas schiefgeht
            return const Center(
              child: Text('Fehler beim Laden der Favoriten.'),
            );
          }

          final favorites = snapshot.data ?? [];
          if (favorites.isEmpty) {
            // Leeren Zustand anzeigen, wenn keine Favoriten vorhanden sind
            return const EmptyFavoritesContent();
          }

          // Liste der Favoritenkarten
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final item = favorites[index];
              return Dismissible(
                // Ich setze hier einen eindeutigen Key basierend auf der ID des Items.
                key: ValueKey(item.id),
                // Ich ermögliche das Wischen nach links, um ein Item zu entfernen.
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) => _removeFavorite(item), // Favorit löschen
                child: GalleryItemCard(
                  image: item,
                  onTapNavigate: () =>
                      _navigateToDetails(item), // Details anzeigen
                ),
              );
            },
          );
        },
      ),
    );
  }
}
