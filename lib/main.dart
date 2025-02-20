import 'package:flutter/material.dart';
import 'views/auth/login_view.dart';
import 'views/auth/register_view.dart';
import 'views/profile/profile_view.dart';
import 'views/leaderboard/leaderboard_view.dart';
import 'views/game/game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Qui puoi decidere quale schermata mostrare come prima
  // Se vuoi che l'utente debba fare login subito, imposta '/login'.
  // Altrimenti, la Home con '/'.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparks Mobile App Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Rotta iniziale (puoi scegliere '/login' se vuoi mostrare
      // per prima la schermata di login)
      initialRoute: '/',

      // Mappa delle rotte
      routes: {
        '/login': (context) => const LoginScreen1Widget(),
        '/register': (context) => const Loginscreen3Widget(),
        '/profile': (context) => const Profile1Widget(),
        '/leaderboard': (context) => const LeaderboardPage(),
        '/game': (context) => const GameView(),
      },
    );
  }
}
