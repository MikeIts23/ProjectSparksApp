import 'dart:ui'; // Per ImageFilter (blur)
import 'package:flutter/material.dart';

class LoginScreen1Widget extends StatefulWidget {
  const LoginScreen1Widget({Key? key}) : super(key: key);

  @override
  State<LoginScreen1Widget> createState() => _LoginScreen1WidgetState();
}

class _LoginScreen1WidgetState extends State<LoginScreen1Widget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _onSignIn() {
    // Logica invariata
    final username = _usernameController.text;
    final password = _passwordController.text;
    Navigator.pushNamed(context, '/');
  }

  void _onRegister() {
    Navigator.pushNamed(context, '/register');
  }

  void _onForgotPassword() {
    print('Forgot Password cliccato!');
  }

  void _onSignInWithGoogle() => print('Login con Google!');
  void _onSignInWithApple() => print('Login con Apple!');
  void _onSignInWithFacebook() => print('Login con Facebook!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Rimuoviamo tutti i Positioned e background extra
      // e costruiamo un container con gradient e borderRadius
      body: Container(
        // Riempi schermo
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // Gradiente dal nero (#0D0D0D) al viola (#1E0F25) al rosso scuro (#401C1C)
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D), // nero quasi puro
              Color(0xFF1E0F25), // viola scuro
              Color(0xFF401C1C), // rosso scuro bruciato
            ],
            stops: [0.0, 0.6, 1.0], // regola se vuoi transizione
          ),
          // Bordi arrotondati sul fondo
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          // Spazio interno per far scorrere i widget
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titolo
                const SizedBox(height: 80),
                const Text(
                  'Welcome Sparky',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'welcome back we missed you',
                  style: TextStyle(
                    color: Color(0xFFA3A3A3),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 40),

                // Campo Username (Glassmorphism)
                _buildGlassTextLabel('Username'),
                const SizedBox(height: 8),
                _buildGlassTextField(
                  icon: Icons.person,
                  controller: _usernameController,
                  hint: 'Username',
                  obscure: false,
                ),

                const SizedBox(height: 20),

                // Campo Password (Glassmorphism)
                _buildGlassTextLabel('Password'),
                const SizedBox(height: 8),
                _buildGlassTextField(
                  icon: Icons.lock,
                  controller: _passwordController,
                  hint: 'Password',
                  obscure: _obscurePassword,
                  onEyeTap: _togglePasswordVisibility,
                ),

                const SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: _onForgotPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromRGBO(163, 163, 163, 1),
                        fontFamily: 'Poppins',
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Bottone "Sign in" (Soft Glow: viola)
                _buildGlowingButton(
                  text: 'Sign in',
                  onTap: _onSignIn,
                ),

                const SizedBox(height: 40),

                // Separatore OR
                const Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Bottone "Register"
                _buildGlowingButton(
                  text: 'Register',
                  onTap: _onRegister,
                ),

                const SizedBox(height: 40),

                // Sezione "Or continue with"
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white30)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Color.fromRGBO(181, 181, 181, 1),
                          fontSize: 11.25,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white30)),
                  ],
                ),
                const SizedBox(height: 20),

                // Icone Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    GestureDetector(
                      onTap: _onSignInWithGoogle,
                      child: Image.asset(
                        'lib/assets/images/google.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 40),

                    // Apple
                    GestureDetector(
                      onTap: _onSignInWithApple,
                      child: Image.asset(
                        'lib/assets/images/apple.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 40),

                    // Facebook
                    GestureDetector(
                      onTap: _onSignInWithFacebook,
                      child: Image.asset(
                        'lib/assets/images/facebook.png',
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
      ),
    );
  }

  // Label "Username", "Password", con stile
  Widget _buildGlassTextLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color.fromRGBO(163, 163, 163, 1),
        fontSize: 14,
      ),
    );
  }

  // Campo di testo in stile glassmorphism (sfondo semi-trasparente + blur)
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
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.3), // ~70% opacità scura
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              if (onEyeTap != null)
                IconButton(
                  icon: Icon(
                    obscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
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

  // Bottone con gradiente viola e bagliore soffuso
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
          // Gradiente viola (#A349F5 -> #6B23F8)
          gradient: const LinearGradient(
            colors: [
              Color(0xFFA349F5),
              Color(0xFF6B23F8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // Bagliore soffuso viola
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA349F5).withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 0),
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
