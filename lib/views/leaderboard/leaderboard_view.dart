import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/custom_navbar.dart';
import 'dart:math' as math;

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  LeaderboardPageState createState() => LeaderboardPageState();
}

class LeaderboardPageState extends State<LeaderboardPage> {
  int _selectedTab = 0; // 0 = Friends, 1 = National, 2 = Global

  // Cambia tab
  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C203D), // sfondo scuro

      body: SafeArea(
        child: Stack(
          children: [
            // ---------- TITOLO "Leaderboard" ----------
            const Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            // ---------- TABS "Friends / National / Global" ----------
            Positioned(
              top: 80,
              left: 15,
              right: 15,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(30, 34, 55, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem('Friends', 0),
                    _buildTabItem('National', 1),
                    _buildTabItem('Global', 2),
                  ],
                ),
              ),
            ),

            // ---------- CONTENUTO PRINCIPALE ----------
            Positioned.fill(
              top: 140,
              child: SingleChildScrollView(
                child: _buildLeaderboardContent(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const navbar(),
    );
  }

  /// Ricostruisce la porzione di UI con i 3 “podii”
  /// e l’elenco degli altri utenti (statico, ma può diventare dinamico).
  Widget _buildLeaderboardContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          // --- Podio dei primi 3 ---
          _buildPodium(),
          const SizedBox(height: 20),

          // --- Lista dei partecipanti successivi ---
          Column(
            children: [
              _buildLeaderItem(
                avatar: 'assets/images/Ellipse11.png',
                username: 'Sebastian',
                usertag: '@username',
                score: 1124,
              ),
              const Divider(color: Color.fromARGB(255, 94, 89, 89)),
              _buildLeaderItem(
                avatar: 'assets/images/Ellipse12.png',
                username: 'Jason',
                usertag: '@username',
                score: 875,
              ),
              const Divider(color: Color.fromARGB(255, 94, 89, 89)),
              _buildLeaderItem(
                avatar: 'assets/images/Ellipse13.png',
                username: 'Natalie',
                usertag: '@username',
                score: 774,
              ),
              const Divider(color: Color.fromARGB(255, 94, 89, 89)),
              _buildLeaderItem(
                avatar: 'assets/images/Ellipse14.png',
                username: 'Serenity',
                usertag: '@username',
                score: 723,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- TABS ----------
  Widget _buildTabItem(String label, int index) {
    final bool isSelected = (_selectedTab == index);

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        width: 80,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            if (isSelected)
              Container(
                width: 45,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(105, 155, 247, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ---------- PODIO CENTRALE ----------
  Widget _buildPodium() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(30, 34, 55, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // “Podio” centrale (Eiden)
          Positioned(
            top: 0,
            child: Container(
              width: 122,
              height: 160,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(37, 42, 64, 1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          // Foto Eiden (centrale)
          Positioned(
            top: 0,
            child: Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(255, 170, 0, 1),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(82),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Ellipse14.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Nome e punteggio Eiden
          const Positioned(
            top: 90,
            child: Column(
              children: [
                Text(
                  'Eiden',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  '2430',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 170, 0, 1),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Indice #1
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: _buildBadgeIndex('1', const Color.fromRGBO(255, 170, 0, 1)),
          ),

          // Foto Jackson (sinistra)
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(0, 155, 214, 1),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(68),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Ellipse15.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Nome e punteggio Jackson (sinistra)
          const Positioned(
            left: 5,
            bottom: 0,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'Jackson',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  '1847',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 155, 214, 1),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Indice #2 (sinistra)
          Positioned(
            left: 25,
            top: 30,
            child: Transform.rotate(
              angle: -45 * (math.pi / 180),
              child: _buildSmallSquare(
                color: const Color.fromRGBO(0, 155, 214, 1),
                label: '2',
              ),
            ),
          ),

          // Foto Emma Aria (destra)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(0, 217, 95, 1),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(68),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Ellipse16.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Nome e punteggio Emma Aria (destra)
          const Positioned(
            right: 5,
            bottom: 0,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'Emma Aria',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  '1674',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 217, 95, 1),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Indice #3 (destra)
          Positioned(
            right: 25,
            top: 30,
            child: Transform.rotate(
              angle: -45 * (math.pi / 180),
              child: _buildSmallSquare(
                color: const Color.fromRGBO(0, 217, 95, 1),
                label: '3',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- QUADRATO PICCOLO (1,2,3) ----------
  Widget _buildSmallSquare({required Color color, required String label}) {
    return Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }

  // ---------- CORONA #1 (sopra Eiden) ----------
  Widget _buildBadgeIndex(String label, Color color) {
    return SizedBox(
      width: 34,
      height: 26,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Icona corona da SVG (sostituisci con la tua se vuoi)
          Positioned(
            top: 7,
            left: 3,
            child: SvgPicture.asset(
              'assets/images/vector.svg',
              height: 12,
              width: 12,
              color: color,
            ),
          ),
          // Cerchietto in alto
          Positioned(
            top: 0,
            left: 13,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          // Numero #1
          Positioned(
            bottom: 0,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- UTENTE SEMPLICE (LISTA SUCCESSIVI) ----------
  Widget _buildLeaderItem({
    required String avatar,
    required String username,
    required String usertag,
    required int score,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Nome + tag
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  usertag,
                  style: const TextStyle(
                    color: Color.fromRGBO(182, 179, 179, 1),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          // Punteggio
          Text(
            score.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
