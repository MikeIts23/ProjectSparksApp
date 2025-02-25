import 'package:flutter/material.dart';

// Importa qui TUTTE le pagine che utilizzi.
// Sostituisci i path con quelli reali del tuo progetto.
import 'views/auth/login_view.dart';
import 'views/auth/register_view.dart';
import 'views/profile/profile_view.dart';
import 'views/leaderboard/leaderboard_view.dart';
import 'views/game/game_view.dart';

// Aggiungi anche i file delle nuove pagine
import 'views/profile/edit_profile.dart';    // Esempio
import 'views/profile/contact_view.dart';    // Esempio
import 'views/profile/privacy_view.dart';    // Esempio

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparks Mobile App Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,

      // Schermata iniziale (login)
      initialRoute: '/login',

      // Definizione delle rotte con onGenerateRoute
      onGenerateRoute: (settings) {
        switch (settings.name) {

        // Rotte già esistenti
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginScreen1Widget());
          case '/register':
            return MaterialPageRoute(builder: (_) => const Loginscreen3Widget());
          case '/profile':
            return MaterialPageRoute(builder: (_) => const Profile1Widget());
          case '/leaderboard':
            return MaterialPageRoute(builder: (_) => const LeaderboardPage());
          case '/game':
            return MaterialPageRoute(builder: (_) => const GameView());

        // Nuove rotte
          case '/edit_profile':
            return MaterialPageRoute(builder: (_) => const EditProfilePage());
          case '/privacy_view':
            return MaterialPageRoute(builder: (_) => const PrivacyPolicyPage());

        // Rotta di default se non corrisponde nulla
          default:
            return MaterialPageRoute(builder: (_) => const LoginScreen1Widget());
        }
      },
    );
  }
}
