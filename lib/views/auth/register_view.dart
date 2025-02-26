import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'background_widget.dart';

class Loginscreen3Widget extends StatefulWidget {
  const Loginscreen3Widget({Key? key}) : super(key: key);

  @override
  Loginscreen3WidgetState createState() => Loginscreen3WidgetState();
}

class Loginscreen3WidgetState extends State<Loginscreen3Widget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _onSignUp() {
    Navigator.pushNamed(context, '/game');
  }

  void _onSignUpWithGoogle() => print('Sign up con Google');
  void _onSignUpWithApple() => print('Sign up con Apple');
  void _onSignUpWithFacebook() => print('Sign up con Facebook');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Sfondo generico con BackgroundWidget (eventuale decorazione extra)
          const Positioned.fill(
            child: BackgroundWidget(),
          ),
          // Illustrazione in alto
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Illustration.png',
              fit: BoxFit.fitWidth,
              height: 265,
            ),
          ),
          // Contenuto principale scrollabile con gradiente e bordi inferiori arrotondati
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              // Applichiamo il gradiente e arrotondiamo il fondo
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0D0D0D),
                    Color(0xFF1E0F25),
                    Color(0xFF401C1C),
                  ],
                  stops: [0.0, 0.6, 1.0],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              // Si inizia sotto l'illustrazione
              margin: EdgeInsets.only(top: 265),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontFamily: 'Inter',
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo Email con effetto glass
                  _buildGlassLabel('Email'),
                  const SizedBox(height: 8),
                  _buildGlassTextField(
                    icon: Icons.email,
                    controller: _emailController,
                    hint: 'youremail@example.com',
                    obscure: false,
                  ),
                  const SizedBox(height: 20),

                  // Campo Nome con effetto glass
                  _buildGlassLabel('Your Name'),
                  const SizedBox(height: 8),
                  _buildGlassTextField(
                    icon: Icons.person,
                    controller: _nameController,
                    hint: '@yourname',
                    obscure: false,
                  ),
                  const SizedBox(height: 20),

                  // Campo Password con effetto glass e toggle visibilità
                  _buildGlassLabel('Password'),
                  const SizedBox(height: 8),
                  _buildGlassTextField(
                    icon: Icons.lock,
                    controller: _passwordController,
                    hint: '********',
                    obscure: _obscurePassword,
                    onEyeTap: _togglePasswordVisibility,
                  ),
                  const SizedBox(height: 30),

                  // Bottone "Sign up" con effetto soft glow
                  _buildGlowingButton(text: 'Sign up', onTap: _onSignUp),
                  const SizedBox(height: 40),

                  // Separatore "Or continue with"
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white30)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Color(0xFFB5B5B5),
                            fontSize: 11.25,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white30)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Icone Social (Google, Apple, Facebook)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _onSignUpWithGoogle,
                        child: Image.asset(
                          'lib/assets/images/google.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: _onSignUpWithFacebook,
                        child: Image.asset(
                          'lib/assets/images/facebook.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: _onSignUpWithApple,
                        child: Image.asset(
                          'lib/assets/images/apple.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Metodo per creare le etichette degli input
  Widget _buildGlassLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFFA3A3A3),
        fontSize: 14,
      ),
    );
  }

  // Metodo per creare i campi di input con effetto glass
  Widget _buildGlassTextField({
    required IconData icon,
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    VoidCallback? onEyeTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF2C2C2C).withOpacity(0.7),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              if (onEyeTap != null)
                IconButton(
                  icon: Icon(
                    obscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: onEyeTap,
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Bottone con gradiente viola e soft glow
  Widget _buildGlowingButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFA349F5),
              Color(0xFF6B23F8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFA349F5).withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
