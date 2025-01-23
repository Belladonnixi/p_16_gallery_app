import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/app/app.dart';
import 'package:flutter/services.dart';

void main() {
  // Startet die App und setzt die App auf Portrait-Modus
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MainApp());
  });
}
