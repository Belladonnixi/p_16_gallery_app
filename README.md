# P16 Gallery App

## Ziel

![Screenshot 2025-01-15 at 11 01 15](https://github.com/user-attachments/assets/88531258-f828-47c7-889c-3afd184a6de1)

## Aufgabe

- Die Bildergalerie-App soll eine benutzerfreundliche Oberfläche bieten, die es den Nutzern ermöglicht,       
  Bilder in einer ansprechenden Grid- oder Listenansicht zu durchsuchen. 
  Die App muss mindestens zwei Hauptbereiche in der Navigation enthalten.
  
- Beim Klicken auf ein Bild, soll ein BottomSheet hochgefahren werden, welches das Bild, das (imaginäre)        Aufnahmedatum des Bilds, sowie einen zugehörigen Text anzeigt.
  
- Du kannst entscheiden, ob du die App basierend auf den bereitgestellten Screens abänderst oder eine eigene    kreative Richtung einschlägst.
  In dem angehängten .zip Verzeichnis findest du die Bilder aus den Screenshots. Zusätzlich gibt es dort eine   Datei “gallery_data.dart” die eine bereits gefüllte Liste an GalleryItem Objekten beinhaltet. Diese kannst    du verwenden und/oder anpassen., Du musst aber die Klasse GalleryItem selbst erstellen.
  
### Anforderungen:
Mindestens zwei Bereiche in der Navigation.
Verwendung von GridView oder ListView auf einer Seite zur Anzeige von Bildern.
Die Basis der Entwicklung sind die Screenshots in den bereitgestellten Slides. Du hast die Freiheit, die App nach eigenen Vorstellungen anzupassen oder sie einem bestimmten Motto entsprechend zu gestalten. Ziel ist es, eine ansprechende und funktionale Bildergalerie App zu erstellen, die die persönliche Kreativität und Programmierfähigkeiten widerspiegelt.

## Lösung

Ich habe es klein gelassen und Daten und Bilder geändert und darüber das Topic geändert ohne jetzt komplett ohne Designvorlauf da etwas völlig anderes daraus zu machen. Deshalb habe ich das Grundkonzept beibehalten bisher auch nicht wirklich Feature mäßig erweitert eine klassische Favoriten Sache wäre jetzt noch denkbar auf aktuellem Stand ging es mir darum Usabillity so weit glatt zu ziehen wie eben mit Fehleranzeigen wenn ein Laden der Daten nicht möglich sein sollte usw. um mich auch damit wieder mehr zu befassen.
Hübsche bunte Dinge im UI sind toll, damit es rund ist gehört mehr dazu. Und in den meisten Fällen ist die DB eben nicht on Board sondern außen, deshalb habe ich diesen Passus drauf gesetzt.
Und ja ich weiß konsequenter weise hätte ich die Bilder dann besser auch als url genommen schlicht und ergreifend, kann man streiten, kann man für diesen Fall aber auch sein lassen. Ich habe wenigstens versucht ein bissel real world einziehen zu lassen. Das ist ja kein production project.


- erweitert um Theming und Dark & Light Mode (dafür das ich das quasi on the run gemacht habe, gar nicht mal so schlecht, aber auch nicht sonst wie gut)
- Bilder geändert und Daten (Dabei das ist ein guter AI task Bilder von unsplash und sich Dinge wie Titel zu den Bildern , Descriptions und Datum jeweils generieren       lassen)
- Databserepository mit MockDatabaseRepository genutzt, Spaßeshalber mal wieder da ein Delay eingebaut
- Fehlerzustände beim Laden der Daten getestet (manuell) dafür aber entsprechend das MockDatabaseRepository dafür angepasst und auch den Gallery Screen
- pull to refresh in der Gallery
- ich bin aber im Flutter Standard geblieben und habe kein weiteres StateManagement benutzt
- SplashScreen zugefügt
- um named Routing erweitert
- Flutter_gen für das generieren der Image pathes genutzt
- und das Logo auf dem SplashScreen geht auch auf Chat GPT für so eine Aufgabe völlig ausreichend, für Production sollte man lieber entweder selbst von der Pieke auf basteln oder aber einen Graphiker oder Designer dazu holen
- Device Orientation ist festgenagelt auf Portrait

## UI 

### LightMode:
![Screenshot 2025-01-16 at 14 40 52](https://github.com/user-attachments/assets/43ae9a40-9a2c-4142-97b4-9fb4815a8c41)

### DarkMode
![Screenshot 2025-01-16 at 14 42 13](https://github.com/user-attachments/assets/aeb98317-7b7a-4038-b61b-df41dbf51749)


### Fazit
Wenigstens ein kleines, ich weiß so schon wieder absolut warum ich das arbeiten mit State Management Lösungen weit mehr bevorzuge tatsächlich. Bei so etwas sehr kleinem geht es noch, aber das man auf der Ebene Logik und View in einem hat, finde ich unangenehm unübersichtlich.
Ich baue definitiv nichts mehr ohne State Management wodurch ich einfach eine saubere Kapselung von Logig und View haben kann. Und viel größer als so möchte ich das auch nicht bauen, genau deshalb.