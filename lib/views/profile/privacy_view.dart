import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Niente AppBar “classica” per aderire allo stile di Figma
      body: Stack(
        children: [
          // ---------- SFONDO ----------
          Positioned.fill(
            child: Image.asset(
              'assets/images/Profile3.png',
              fit: BoxFit.cover,
            ),
          ),

          // ---------- CONTENUTO PRINCIPALE ----------
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- FRECCIA BACK + TITOLO ----------
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Torna indietro
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/images/vector.svg', // la tua icona di back
                          width: 35,
                          height: 35,
                          // Se vuoi cambiare colore: color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 32,
                          height: 1.0, // da Figma: 0.875, arrotondiamo a 1
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ---------- BLOCCO 1: TYPES DATA WE COLLECT ----------
                  const Text(
                    '1. Types data we collect',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.''',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      height: 1.5, // per migliorare la leggibilità
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ---------- BLOCCO 2: USE OF YOUR PERSONAL DATA ----------
                  const Text(
                    '2. Use of your personal data',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '''Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.''',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ---------- BLOCCO 3: DISCLOSURE OF YOUR PERSONAL DATA ----------
                  const Text(
                    '3. Disclosure of your personal data',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '''At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.

Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.

Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus''',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 254, 254, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
