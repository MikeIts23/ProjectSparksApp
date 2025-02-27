import 'dart:math';
import 'package:flutter/material.dart';
import '../../common/custom_navbar.dart'; // La tua navbar personalizzata

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  // Indice del tab selezionato: 0 = Friends, 1 = National, 2 = Global
  int _selectedTab = 0;

  late List<Map<String, dynamic>> _podium;
  late List<Map<String, dynamic>> _userList;

  @override
  void initState() {
    super.initState();
    // Generiamo sia il podio che la lista random alla partenza
    _podium = _generateRandomPodium();
    _userList = _generateRandomUsers();
  }

  List<Map<String, dynamic>> _generateRandomPodium() {
    final random = Random();

    // Dati di base: nomi, rank e color fissi
    final podiumNames = ['Jackson', 'Eiden', 'Emma Aria'];
    final rankColors = [
      const Color.fromRGBO(0, 155, 214, 1), // Jackson (2°)
      const Color.fromRGBO(255, 170, 0, 1), // Eiden (1°)
      const Color.fromRGBO(0, 217, 95, 1),  // Emma (3°)
    ];
    final ranks = [2, 1, 3];
    final rectHeights = [120.0, 159.0, 120.0];

    // Creiamo un seed casuale per ognuno
    final seeds = List.generate(3, (_) => random.nextInt(999999));

    final podium = <Map<String, dynamic>>[];
    for (var i = 0; i < 3; i++) {
      final seed = seeds[i];
      // Immagine da Picsum con dimensione ~80x80
      final imageUrl = 'https://picsum.photos/seed/$seed/80';

      // Punteggio random (1000..3000)
      final score = 1000 + random.nextInt(2001);

      final randomUsername = _generateRandomUsername(random);

      podium.add({
        'name': podiumNames[i],
        'score': score,
        'borderColor': rankColors[i],
        'rank': ranks[i],
        'rectHeight': rectHeights[i],
        'img': imageUrl,          // Immagine random da Picsum
        'username': randomUsername,
      });
    }

    return podium;
  }

  /// Genera una lista di utenti con nomi e immagini casuali (Picsum).
  /// Punteggi random (500..1500), username random.
  List<Map<String, dynamic>> _generateRandomUsers() {
    final random = Random();

    // Possibili nomi
    final possibleNames = [
      'Sebastian', 'Jason', 'Natalie', 'Serenity', 'Thomas',
      'Adriana', 'Luca', 'Michele', 'Sophie', 'Anna',
      'Gabriel', 'Chiara', 'Lorenzo', 'Giulia', 'Rebecca',
      'Matteo', 'Francesca', 'Marco', 'Daria',
    ];

    // Mescoliamo i nomi
    possibleNames.shuffle(random);

    // Selezioniamo i primi 7
    final selected = possibleNames.take(7).toList();

    final userList = <Map<String, dynamic>>[];
    for (var name in selected) {
      final score = 500 + random.nextInt(1001); // 500..1500
      final seed = random.nextInt(999999);
      final imageUrl = 'https://picsum.photos/seed/$seed/50';
      final randomUsername = _generateRandomUsername(random);

      userList.add({
        'name': name,
        'img': imageUrl,
        'score': score,
        'username': randomUsername,
      });
    }

    return userList;
  }

  /// Genera un username casuale tipo "@user1234"
  String _generateRandomUsername(Random random) {
    final number = random.nextInt(9999); // 0..9999
    return '@user$number';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const navbar(),

      body: Container(
        // Sfondo scuro a gradiente
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1C203D), // in alto
              Color(0xFF2B3055), // in basso
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                // ---------- TITOLO ----------
                const Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 20),

                // ---------- TABS (Friends, National, Global) ----------
                _buildTabs(),

                const SizedBox(height: 20),

                // ---------- PODIO ----------
                _buildPodium(),

                const SizedBox(height: 30),

                // ---------- LISTA UTENTI ----------
                _buildUserListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Barra in alto con 3 tab e un indicatore sotto
  Widget _buildTabs() {
    final tabs = ['Friends', 'National', 'Global'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(tabs.length, (index) {
        final isSelected = (index == _selectedTab);
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = index;
              // Rigenera sia il podio che la lista
              _podium = _generateRandomPodium();
              _userList = _generateRandomUsers();
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tabs[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 50 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromRGBO(105, 155, 247, 1) // blu di evidenza
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// Podio con i 3 partecipanti: 2°, 1°, 3°, con punteggi e immagini random
  Widget _buildPodium() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPodiumColumn(_podium[0]),
        _buildPodiumColumn(_podium[1]),
        _buildPodiumColumn(_podium[2]),
      ],
    );
  }

  /// Singola colonna del podio, con rettangolo dietro e cerchio davanti
  Widget _buildPodiumColumn(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final score = data['score'] as int;
    final imgUrl = data['img'] as String;
    final borderColor = data['borderColor'] as Color;
    final rank = data['rank'] as int;
    final rectHeight = data['rectHeight'] as double;
    final username = data['username'] as String;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Rettangolo + cerchio in uno Stack
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 122,
              height: rectHeight,
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(30, 34, 55, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 3),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl), // da Picsum
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Nome
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),

        // Username
        Text(
          username,
          style: const TextStyle(
            color: Color.fromRGBO(182, 179, 179, 1),
            fontSize: 10,
          ),
        ),

        // Punteggio (colore in base al rank)
        Text(
          '$score',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: (rank == 1)
                ? const Color.fromRGBO(255, 170, 0, 1)
                : (rank == 2)
                ? const Color.fromRGBO(0, 155, 214, 1)
                : const Color.fromRGBO(0, 217, 95, 1),
          ),
        ),
      ],
    );
  }

  /// Widget che mostra la lista di utenti random con immagini da Picsum
  Widget _buildUserListWidget() {
    return Column(
      children: List.generate(_userList.length, (index) {
        final user = _userList[index];
        return Column(
          children: [
            // Riga utente
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  // Immagine da Picsum
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      user['img'] as String,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Nome e username
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user['username'] as String,
                          style: const TextStyle(
                            color: Color.fromRGBO(182, 179, 179, 1),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Punteggio a destra
                  Text(
                    '${user['score']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // Divider
            if (index < _userList.length - 1)
              Container(
                height: 1,
                color: const Color.fromRGBO(94, 89, 89, 1),
              ),
          ],
        );
      }),
    );
  }
}
