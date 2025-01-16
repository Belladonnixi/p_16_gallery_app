import 'dart:io';
import 'dart:math';
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
  static const String defaultAppBarTitle = 'MyGallery';
  String _appBarTitle = defaultAppBarTitle;
  final Set<Object> _shownErrors = {};

  // Datenrepository, um die Galerie-Daten zu laden
  // MockDatabaseRepository(errorType: MockErrorType.none) ist im Standard bereits gesetzt
  final DatabaseRepository _repository =
      MockDatabaseRepository(/* errorType: MockErrorType.networkError */);

  // Future, das die geladenen Galerie-Daten enthält
  late Future<List<GalleryItem>> _galleryData;

  @override
  void initState() {
    super.initState();
    // Daten beim Start laden
    _galleryData = _loadData();
  }

  // Lädt die Galerie-Daten aus dem Repository
  Future<List<GalleryItem>> _loadData() async {
    try {
      // Daten erfolgreich laden
      return await _repository.getGalleryItems();
    } catch (error) {
      // Fehler beim Laden der Daten behandeln und Snackbar anzeigen
      _handleError(error);
      return []; // Leere Liste zurückgeben, um Absturz zu vermeiden
    }
  }

  // Diese Methode ändert den Titel der App-Leiste zwischen 'MyGallery' und 'Details',
  // wenn das BottomSheet aufgerufen wird
  void _toggleAppBarTitle() {
    setState(() {
      _appBarTitle =
          _appBarTitle == defaultAppBarTitle ? 'Details' : defaultAppBarTitle;
    });
  }

  // Lädt die Daten neu und mischt sie zufällig
  Future<void> _reloadData() async {
    try {
      // Galerie-Daten neu laden
      List<GalleryItem> items = await _repository.getGalleryItems();

      // Daten zufällig mischen
      items.shuffle(Random());

      // Aktualisiere den Zustand mit den neuen Daten
      setState(() {
        _galleryData = Future.value(items);
      });
    } catch (error) {
      // Fehler beim erneuten Laden behandeln
      _handleError(error);
    }
  }

  // Zentrale Methode zur Fehlerbehandlung.
  // Zeigt eine Snackbar mit einer Fehlermeldung an, abhängig vom Fehler.
  void _handleError(Object error) {
    if (_shownErrors.contains(error)) return; // Fehler bereits behandelt

    _shownErrors.add(error); // Fehler registrieren
    final message = error is SocketException
        ? 'Netzwerkfehler: Verbindung fehlgeschlagen.'
        : 'Ein Fehler ist aufgetreten: ${error.toString()}';

    _showErrorSnackbar(message);
  }

  // Diese Methode zeigt eine Snackbar mit einer Fehlermeldung an.
  // Die Snackbar enthält einen TextButton, um die Daten erneut zu laden.
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Ladezustand der Galerieansicht, zeigt den CircularProgressIndicator an,
  // so ausgelagert, damit die build-Methode schlanker bleibt
  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  // Fehlerzustand der Gallery View, zeigt eine Snackbar mit der Fehlermeldung an,
  // entsprechend des Fehlers, der geworfen wurde
  Widget _buildErrorState(AsyncSnapshot<List<GalleryItem>> snapshot) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (snapshot.error != null) {
        _handleError(snapshot.error!);
      }
    });
    return const Center(
      child: Text('Fehler beim Laden der Daten.'),
    );
  }

  // Hier wird der leere Zustand der Galerie erstellt, wenn keine Daten da sind.
  // Zeigt dann eine Meldung an, dass keine Daten verfügbar sind,
  // und ermöglicht es, die Daten erneut zu laden.
  Widget _buildEmptyState() {
    return RefreshIndicator(
      onRefresh: _reloadData,
      child: ListView(
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Keine Daten verfügbar. Wischen Sie nach unten, um es erneut zu versuchen.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hier wird die Galerie erstellt, wenn die Daten vorhanden sind.
  Widget _buildGallery(List<GalleryItem> galleryData) {
    return RefreshIndicator(
      onRefresh: _reloadData,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: galleryData.length, // Anzahl der Daten
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: FutureBuilder<List<GalleryItem>>(
        future: _galleryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingState();
          } else if (snapshot.hasError) {
            return _buildErrorState(snapshot);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyState();
          } else {
            return _buildGallery(snapshot.data!);
          }
        },
      ),
    );
  }
}
