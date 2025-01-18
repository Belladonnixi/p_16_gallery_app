import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/data/model/gallery_item.dart';
import 'package:p_16_gallery_app/data/repositories/mock_database_repository.dart';

class FavoriteDetailsTitleRow extends StatefulWidget {
  const FavoriteDetailsTitleRow({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  State<FavoriteDetailsTitleRow> createState() =>
      _FavoriteDetailsTitleRowState();
}

class _FavoriteDetailsTitleRowState extends State<FavoriteDetailsTitleRow>
    with SingleTickerProviderStateMixin {
  late bool _isFavorite; // Direkte Zustandsvariable für Favoritenstatus
  final MockDatabaseRepository _repository = MockDatabaseRepository();

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialen Favoritenstatus laden
    _isFavorite = false;
    _repository.getFavorites().then((favorites) {
      setState(() {
        _isFavorite = favorites.contains(widget.item);
      });
    });

    // AnimationController steuert die Animation des Icons.
    // `vsync: this` sorgt dafür, dass die Animation effizient abläuft und nur gerendert wird, wenn das Widget sichtbar ist.
    // Die Dauer der Animation ist hier auf 300 Millisekunden gesetzt.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Mit Tween legen wir den Animationsbereich fest – das Icon soll von normaler Größe (1.0)
    // auf eine vergrößerte Größe (1.5) skalieren.
    // `CurvedAnimation` sorgt dafür, dass die Bewegung nicht linear ist, sondern sanft beschleunigt und abbremst
    // (dank `Curves.easeOut`).
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )

      // Listener, um die Animation automatisch zurückzusetzen, sobald sie fertig ist.
      // Wenn die Animation vollständig ausgeführt wurde (`AnimationStatus.completed`),
      // wird der Controller zurückgesetzt (`reverse()`), damit das Icon wieder seine ursprüngliche Größe erreicht.
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite() async {
    // Wenn das Item schon Favorit ist, entfernen wir es
    if (_isFavorite) {
      // Favorit aus dem Repository entfernen
      await _repository.removeFavorite(widget.item);

      // Sicherstellen, dass das Widget noch existiert, bevor wir eine Snackbar anzeigen
      if (!mounted) return;

      // Snackbar schließen, falls noch eine offen ist
      ScaffoldMessenger.of(context).clearSnackBars();

      // Snackbar, um dem User Feedback zu geben, dass der Favorit entfernt wurde
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('${widget.item.imageTitle} wurde aus Favoriten entfernt.'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // Wenn das Item noch kein Favorit ist, fügen wir es hinzu
      await _repository.addFavorite(widget.item);

      // Auch hier sicherstellen, dass das Widget noch im Baum ist
      if (!mounted) return;

      // Snackbar schließen, falls noch eine offen ist
      ScaffoldMessenger.of(context).clearSnackBars();

      // Snackbar für Feedback, dass der Favorit hinzugefügt wurde
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('${widget.item.imageTitle} wurde als Favorit hinzugefügt!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    // Den Favoritenstatus lokal umschalten, damit die UI aktualisiert wird
    setState(() {
      _isFavorite = !_isFavorite;
    });

    // Animation starten – das Icon wird vergrößert und kehrt zurück
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Titel und Datum
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.imageTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              widget.item.imageDate,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        // Favoriten-Icon
        ScaleTransition(
          scale: _scaleAnimation,
          child: IconButton(
            iconSize: 32,
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
            ),
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}
