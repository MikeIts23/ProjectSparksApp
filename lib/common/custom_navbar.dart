import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    if (_selectedIndex != index) {  // Evita navigazione ripetuta sulla stessa pagina
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
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromRGBO(28, 32, 61, 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.leaderboard, 'Rank', 0),
            _buildNavItem(Icons.play_arrow, 'Game', 1),
            _buildNavItem(Icons.person, 'Account', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
