import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/custom_navbar.dart';

class Profile1Widget extends StatefulWidget {
  const Profile1Widget({Key? key}) : super(key: key);

  @override
  Profile1WidgetState createState() => Profile1WidgetState();
}

class Profile1WidgetState extends State<Profile1Widget> {
  bool _notificationsOn = true;
  File? _pickedImage;
  bool _enableScroll = false;   // Se true, abilita lo scrolling
  final GlobalKey _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Al termine del primo frame, controlliamo se il contenuto supera lo schermo
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkContentHeight());
  }

  /// Misura l'altezza effettiva del contenuto e decide se abilitare lo scroll
  void _checkContentHeight() {
    final renderBox = _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final contentHeight = renderBox.size.height;
      final screenHeight = MediaQuery.of(context).size.height;

      final shouldScroll = contentHeight > screenHeight;
      if (_enableScroll != shouldScroll) {
        setState(() {
          _enableScroll = shouldScroll;
        });
      }
    }
  }

  /// Mostra un bottom sheet con due opzioni: fotocamera o galleria
  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Scatta una foto'),
                onTap: () async {
                  final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                  if (image != null) {
                    setState(() {
                      _pickedImage = File(image.path);
                    });
                    // Ricontrolla l'altezza, potrebbe cambiare leggermente
                    WidgetsBinding.instance.addPostFrameCallback((_) => _checkContentHeight());
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Seleziona dalla galleria'),
                onTap: () async {
                  final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                  if (image != null) {
                    setState(() {
                      _pickedImage = File(image.path);
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) => _checkContentHeight());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 32, 61, 1),

      body: Stack(
        children: [
          // -------------- SFONDO CUSTOM PAINT --------------
          Positioned.fill(
            child: CustomPaint(
              painter: _BackgroundPainter(),
            ),
          ),

          // -------------- CONTENUTO PRINCIPALE --------------
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: _enableScroll
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Column(
                  key: _contentKey,
                  children: [
                    const SizedBox(height: 130),

                    // Avatar + icona per cambiare immagine
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(170),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: _pickedImage == null
                                    ? const AssetImage('lib/assets/images/wallapaper.jpg')
                                as ImageProvider
                                    : FileImage(_pickedImage!),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: const Icon(
                                Icons.camera_alt, // icona fotocamera
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

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
                              debugPrint('Tap su Language');
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
              );
            },
          ),
        ],
      ),

      // -------------- NAVBAR --------------
      bottomNavigationBar: const navbar(),
    );
  }
}

/// Painter che disegna la parte alta con un gradiente giallo→verde
/// e la parte bassa con gradiente #1C203D → #4B56A3, separate da una curva.
class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double curveHeight = size.height * 0.4;

    // ---------- GRADIENTE SUPERIORE (GIALLO→VERDE) ----------
    final paintTop = Paint();
    final gradientTop = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFBB03B),
        Color(0xFF7BE495),
      ],
    );
    final rectTop = Rect.fromLTWH(0, 0, size.width, curveHeight);
    paintTop.shader = gradientTop.createShader(rectTop);

    final pathTop = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, curveHeight)
      ..quadraticBezierTo(
        size.width * 0.5,
        curveHeight + 50,
        0,
        curveHeight,
      )
      ..close();
    canvas.drawPath(pathTop, paintTop);

    // ---------- GRADIENTE INFERIORE (#1C203D → #4B56A3) ----------
    final paintBottom = Paint();
    final gradientBottom = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1C203D),
        Color(0xFF4B56A3),
      ],
    );
    final rectBottom = Rect.fromLTWH(0, curveHeight, size.width, size.height - curveHeight);
    paintBottom.shader = gradientBottom.createShader(rectBottom);

    final pathBottom = Path()
      ..moveTo(0, curveHeight)
      ..quadraticBezierTo(
        size.width * 0.5,
        curveHeight + 50,
        size.width,
        curveHeight,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(pathBottom, paintBottom);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
