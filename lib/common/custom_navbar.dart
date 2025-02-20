import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  navbarState createState() => navbarState();
}

class navbarState extends State<navbar> {
  // Indice del tab selezionato (0 = Rank, 1 = Game, 2 = Profile)
  int _selectedIndex = 0;

  // Mappa delle rotte
  final List<String> _routes = [
    '/leaderboard', // "Rank"
    '/game',        // "Game" (usando l'icona polygon1.svg)
    '/profile',     // "Account"
  ];

  // Quando l’utente clicca su un’icona
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Naviga alla rotta corrispondente
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Financenavbar14Widget - INSTANCE
    // Rimuoviamo il width fisso e lasciamo la larghezza dinamica
    return SizedBox(
      width: double.infinity,
      height: 77,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 18,
            right: 18, // così riempiamo lo schermo in orizzontale
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(28, 32, 61, 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // 1) Rank
                  GestureDetector(
                    onTap: () => _onItemTapped(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Sostituisci con l’icona che preferisci
                        const Icon(
                          Icons.leaderboard,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rank',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : const Color.fromRGBO(120, 132, 174, 1),
                            fontFamily: 'Manrope',
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),

                  // 2) Polygon -> Game
                  GestureDetector(
                    onTap: () => _onItemTapped(1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/images/polygon1.svg',
                          semanticsLabel: 'polygon1',
                          height: 24,
                          width: 24,
                          // Se vuoi cambiare colore in base alla selezione
                          color: _selectedIndex == 1
                              ? Colors.white
                              : const Color.fromRGBO(120, 132, 174, 1),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Game',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : const Color.fromRGBO(120, 132, 174, 1),
                            fontFamily: 'Manrope',
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),

                  // 3) Account
                  GestureDetector(
                    onTap: () => _onItemTapped(2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: _selectedIndex == 2
                              ? Colors.white
                              : const Color.fromRGBO(120, 132, 174, 1),
                          size: 24,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Account',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: _selectedIndex == 2
                                ? Colors.white
                                : const Color.fromRGBO(120, 132, 174, 1),
                            fontFamily: 'Manrope',
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
