import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'Diamond_Clipper.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  navbarState createState() => navbarState();
}

class navbarState extends State<navbar> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/leaderboard', // Rank
    '/game',        // Game
    '/profile',     // Account
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.of(context).pushReplacementNamed(_routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 77,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(28, 32, 61, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        // Eventualmente regola il padding per lasciare spazio
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1) Pulsante Rank
            _buildNavItem(
              icon: Icons.leaderboard,
              label: 'Rank',
              index: 0,
            ),

            // 2) Pulsante centrale con l'immagine poligono
            _buildCenterPlayItem(index: 1),

            // 3) Pulsante Account
            _buildNavItem(
              icon: Icons.person,
              label: 'Account',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  // Pulsante Rank / Account standard (icona + testo)
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = (_selectedIndex == index);
    final Color iconColor = isSelected ? Colors.white : Colors.grey;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: iconColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // Bottone centrale con Polygon1Widget
  Widget _buildCenterPlayItem({required int index}) {
    final bool isSelected = (_selectedIndex == index);

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: const SizedBox(
        width: 60, // ingrandisci se vuoi un bottone più grande
        height: 60,
        child: Polygon1Widget(), // L'immagine PNG come bottone
      ),
    );
  }
}
