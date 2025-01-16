import 'dart:io';

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
    // Hier kann ich im Konstruktor den Fehler setzen um es testen zu können
    // MockDatabaseRepository(errorType: MockErrorType.none) ist im Standard schon drin
    _repository = MockDatabaseRepository();
    _galleryData = _repository.getGalleryItems();
  }

  // Diese Methode ändert den Titel der App-Leiste zwischen 'MyGallery' und 'Details' wenn das BottomSheet aufgerufen wird
  void _toggleAppBarTitle() {
    setState(() {
      _appBarTitle = _appBarTitle == 'MyGallery' ? 'Details' : 'MyGallery';
    });
  }

  // lädt die Daten neu
  Future<void> _reloadData() async {
    setState(() {
      _galleryData = _repository.getGalleryItems();
    });
    await _galleryData;
  }

  // Diese Methode zeigt eine Snackbar mit einer Fehlermeldung an.
  // Die Snackbar enthält einen TextButton, um die Daten erneut zu laden.
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Retry',
          onPressed: _reloadData, // Erneut laden
        ),
      ),
    );
  }

  // Ladezustand der Galerieansicht, zeigt den CircularProgressIndicator an so ausgelagert damit ich die build Methode schlanker halten kann
  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  // Fehlerzustand der Gallery View, zeigt eine Snackbar mit der Fehlermeldung an entsprechend des Fehlers der geworfen wurde
  Widget _buildErrorState(AsyncSnapshot<List<GalleryItem>> snapshot) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final error = snapshot.error;

      if (error is SocketException) {
        _showErrorSnackbar('Netzwerkfehler: Verbindung fehlgeschlagen.');
      } else {
        _showErrorSnackbar('Ein Fehler ist aufgetreten: ${error.toString()}');
      }
    });
    return const Center(
      child: Text('Fehler beim Laden der Daten.'),
    );
  }

  // Hier wird der leere Zustand der Gallery erstellt wenn keine Daten da sind.
  // Zeigt dann  eine Meldung an, dass keine Daten verfügbar sind und ermöglicht es die Daten erneut zu laden.
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

  // Hier wird die Gallery erstellt, wenn die Daten vorhanden sind.
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
