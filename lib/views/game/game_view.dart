import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../../common/custom_navbar.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  GameViewState createState() => GameViewState();
}

class GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------- CORPO PRINCIPALE ----------
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // Immagine di sfondo (assicurati di averla nel pubspec.yaml)
          image: DecorationImage(
            image: AssetImage('lib/assets/images/wallapaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // Stack vuoto per il gioco e altri widget futuri
        child: const Stack(
          children: [
            // Qui potrai inserire il tuo gioco o altri widget
          ],
        ),
      ),

      // ---------- NAVBAR IN BASSO ----------
      bottomNavigationBar: const navbar(),
    );
  }
}
