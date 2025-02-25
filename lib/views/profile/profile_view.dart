import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/custom_navbar.dart';
import 'retangle.dart';

class Profile1Widget extends StatefulWidget {
  const Profile1Widget({Key? key}) : super(key: key);

  @override
  Profile1WidgetState createState() => Profile1WidgetState();
}

class Profile1WidgetState extends State<Profile1Widget> {
  bool _notificationsOn = true; // Per gestire lo switch delle notifiche

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 32, 61, 1),

      body: Stack(
        children: [
          // -------------- SFONDO --------------
          Positioned.fill(
            child: Image.asset(
              'assets/images/Profile1.png',
              fit: BoxFit.cover,
            ),
          ),

          // -------------- CONTENUTO PRINCIPALE --------------
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),

                // Avatar + matita
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(170),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Ellipse25.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            // Naviga alla pagina edit_profile.dart
                            Navigator.pushNamed(context, '/editProfile');
                          },
                          child: SvgPicture.asset(
                            'assets/images/vector.svg',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // -------------- CARD 1: EDIT, NOTIFICHE, LINGUA --------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(30, 34, 55, 1),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Edit profile
                      ListTile(
                        leading: const Icon(Icons.edit, color: Colors.white),
                        title: const Text(
                          'Edit profile information',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/edit_profile');
                        },
                      ),
                      Divider(color: Colors.white.withOpacity(0.2), height: 1),

                      // Notifications
                      ListTile(
                        leading: const Icon(Icons.notifications, color: Colors.white),
                        title: const Text(
                          'Notifications',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          activeColor: Colors.blue,
                          value: _notificationsOn,
                          onChanged: (val) {
                            setState(() {
                              _notificationsOn = val;
                            });
                          },
                        ),
                        onTap: () {
                          // Permette di abilitare/disabilitare le notifiche toccando la riga
                          setState(() {
                            _notificationsOn = !_notificationsOn;
                          });
                        },
                      ),
                      Divider(color: Colors.white.withOpacity(0.2), height: 1),

                      // Language
                      ListTile(
                        leading: const Icon(Icons.language, color: Colors.white),
                        title: const Text(
                          'Language',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: const Text(
                          'English',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          print('Tap su Language');
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // -------------- CARD 2: LOG OUT, CONTACT US, PRIVACY POLICY --------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(30, 34, 55, 1),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Log out
                      ListTile(
                        leading: const Icon(Icons.exit_to_app, color: Colors.white),
                        title: const Text(
                          'Log out',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login_view');
                        },
                      ),
                      Divider(color: Colors.white.withOpacity(0.2), height: 1),

                      // Contact us
                      ListTile(
                        leading: const Icon(Icons.contact_support, color: Colors.white),
                        title: const Text(
                          'Contact us',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/contact_view');
                        },
                      ),
                      Divider(color: Colors.white.withOpacity(0.2), height: 1),

                      // Privacy policy
                      ListTile(
                        leading: const Icon(Icons.lock, color: Colors.white),
                        title: const Text(
                          'Privacy policy',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/privacy_view');
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100), // Spazio per non sovrapporsi alla navbar
              ],
            ),
          ),
        ],
      ),

      // -------------- NAVBAR --------------
      bottomNavigationBar: const navbar(),
    );
  }
}
