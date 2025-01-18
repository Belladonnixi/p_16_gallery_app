import 'package:p_16_gallery_app/gen/assets.gen.dart';
import 'package:uuid/uuid.dart';

class GalleryItem {
  GalleryItem({
    String? id,
    required this.imageTitle,
    required this.imageDate,
    required this.imageDescription,
    required this.imagePath,
  }) : id = id ?? const Uuid().v4();
  // id = id ?? const Uuid().v4() bedeutet, dass wenn id null ist, wird eine neue ID generiert

  final String id;
  final String imageTitle;
  final String imageDate;
  final String imageDescription;
  final AssetGenImage imagePath;

// Überschreiben von operator ==: Hier legen wir fest, wann zwei GalleryItem-Objekte
// als "gleich" gelten. Standardmäßig vergleicht Dart Objekte anhand der Speicheradresse,
// aber wir wollen, dass zwei Items gleich sind, wenn sie dieselbe ID haben.
// Das brauchen wir z. B. in Sets, damit diese korrekt funktionieren und keine doppelten
// Einträge erlauben, wenn die IDs übereinstimmen.
  @override
  bool operator ==(Object other) =>
      identical(this,
          other) || // Check: Sind es wirklich genau dieselben Objekte im Speicher?
      other is GalleryItem && // Sind sie überhaupt vom gleichen Typ?
          runtimeType ==
              other.runtimeType && // Sicherheitshalber nochmal Typ checken
          id ==
              other
                  .id; // IDs vergleichen – wenn die gleich sind, sind auch die Objekte gleich

// Überschreiben von hashCode: Damit Sets oder Maps mit GalleryItems richtig arbeiten können,
// brauchen wir einen Hash-Wert für jedes Objekt. Hier nehmen wir die ID als Basis für den Hash,
// weil die ID ja einzigartig ist. So können wir sicherstellen, dass zwei Objekte mit derselben ID
// denselben Hash-Wert haben, was wichtig ist, damit die Datenstruktur zuverlässig funktioniert.
  @override
  int get hashCode => id.hashCode;
}
