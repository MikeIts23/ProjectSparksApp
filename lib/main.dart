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

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparks Mobile App Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
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
          default:
            return MaterialPageRoute(builder: (_) => const LoginScreen1Widget());
        }
      },
    );
  }
}