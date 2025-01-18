import 'dart:math';
import 'package:flutter/widgets.dart';

class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  // Ich übergebe hier die Anzahl der Sternspitzen, um flexibel zu bleiben.
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Der Außenradius entspricht der Hälfte der Breite des Widgets.
    // Dieser Radius definiert die äußersten Punkte des Sterns.
    final double radius = size.width / 2;

    // Der Innenradius ist kleiner als der Außenradius und sorgt dafür,
    // dass der Stern nach innen eingeschnitten wird.
    // Ich wähle hier einen Wert, der 2,5-mal kleiner ist als der Außenradius,
    // um einen harmonischen Stern zu erzeugen.
    final double innerRadius = radius / 2.5;

    // Der Winkel zwischen zwei Sternspitzen (von Spitze zu Spitze, außen).
    // Es handelt sich hier um den vollen Kreis (2 * π), aufgeteilt durch die Anzahl der Spitzen.
    final double angle = (2 * pi) / numberOfPoints;

    // Die Schleife läuft durch alle Punkte des Sterns: Außen- und Innenpunkte.
    // `numberOfPoints * 2` bedeutet: Jede Spitze (außen) hat auch einen entsprechenden Innenpunkt.
    for (int i = 0; i < numberOfPoints * 2; i++) {
      // Der aktuelle Winkel basiert auf der Indexposition im Stern.
      // Ich multipliziere den Index mit `angle / 2`, weil ich abwechselnd
      // Außen- und Innenpunkte setzen möchte.
      final double currentAngle = (i * angle / 2) - (pi / 2);

      // Je nachdem, ob der Punkt gerade oder ungerade ist:
      // - Gerade Punkte liegen außen und verwenden den Außenradius.
      // - Ungerade Punkte liegen innen und verwenden den Innenradius.
      final double currentRadius = i.isEven ? radius : innerRadius;

      // Die x- und y-Koordinaten berechne ich mit der Kreisformel:
      // - `cos(currentAngle)` und `sin(currentAngle)` geben die Richtung des Punktes.
      // - Diese Werte multipliziere ich mit dem aktuellen Radius (außen oder innen),
      //   um die Distanz von der Mitte zu bestimmen.
      // - Die Mitte des Widgets liegt bei `size.width / 2` und `size.height / 2`.
      final double x = size.width / 2 + currentRadius * cos(currentAngle);
      final double y = size.height / 2 + currentRadius * sin(currentAngle);

      if (i == 0) {
        // Beim ersten Punkt setze ich den Startpunkt des Pfads.
        // Hier beginne ich, den Stern zu zeichnen.
        path.moveTo(x, y);
      } else {
        // Für alle weiteren Punkte zeichne ich Linien von Punkt zu Punkt.
        path.lineTo(x, y);
      }
    }

    // Nachdem alle Punkte verbunden sind, schließe ich den Path,
    // damit der Stern eine komplette, geschlossene Form bildet.
    path.close();
    return path;
  }

  // Ich sorge hier dafür, dass der Stern immer neu gezeichnet wird,
  // falls sich etwas geändert hat.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
