import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/gen/assets.gen.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Me',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  Assets.images.matteoVistoccoKi4UgfcJfnYUnsplash.path),
            ),
            Text(
              'Elena Wagner',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Fotografin',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Mein Name ist Elena Wagner, eine 35-jährige Fotografin mit einer tiefen Leidenschaft für die Schönheit der Natur. Mit einem Hintergrund in Umweltwissenschaften und über einem Jahrzehnt Erfahrung in der Naturfotografie habe ich mich darauf spezialisiert, die stillen Momente der Wildnis einzufangen. Meine besondere Stärke liegt in der atmosphärischen Landschafts- und Makrofotografie, wo ich das Zusammenspiel von Licht, Wetter und natürlichen Elementen in eindrucksvolle Bildkompositionen verwandle.Ich glaube daran, dass die Natur ihre eigenen Geschichten erzählt - von majestätischen Berglandschaften über mystische Nebelwälder bis hin zur faszinierenden Welt der Insekten. In meinen Arbeiten strebe ich danach, diese oft übersehenen Momente festzuhalten und ihnen eine besondere Bedeutung zu verleihen. Meine fotografische Reise hat mich von den Alpen bis zu den entlegensten Küsten geführt, wo ich die verschiedenen Facetten unserer natürlichen Umwelt dokumentiere. Dabei entstehen sowohl großformatige Landschaftsaufnahmen als auch detailreiche Makrostudien, die den Betrachter in eine Welt der Entdeckungen entführen. Mein Ziel ist es, durch meine Bilder nicht nur die äußere Schönheit der Natur zu zeigen, sondern auch ihre Verletzlichkeit und Schutzbedürftigkeit zu vermitteln. Jeder Sonnenaufgang in den Bergen, jeder Nebelschwaden im Wald und jede einzelne Biene auf einer Blüte erzählt eine Geschichte von der Kostbarkeit unserer natürlichen Umwelt. Mit meiner Arbeit möchte ich die Menschen inspirieren, genauer hinzusehen und die Wunder der Natur neu zu entdecken.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
