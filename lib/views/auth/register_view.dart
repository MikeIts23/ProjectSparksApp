import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loginscreen3Widget extends StatefulWidget {
  const Loginscreen3Widget({Key? key}) : super(key: key);

  @override
  Loginscreen3WidgetState createState() => Loginscreen3WidgetState();
}

class Loginscreen3WidgetState extends State<Loginscreen3Widget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Per gestire la visibilità della password
  bool _obscurePassword = true;

  // Cambia visibilità password
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _onSignUp() {
    // Per ora, vai a /game
    Navigator.pushNamed(context, '/game');
  }

  // Esempi di handler per i social login
  void _onSignUpWithGoogle() => print('Sign up con Google');
  void _onSignUpWithApple() => print('Sign up con Apple');
  void _onSignUpWithFacebook() => print('Sign up con Facebook');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sfondo scuro
      body: Stack(
        children: [
          // Immagine in alto (Illustrazione)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Illustration.png',
              fit: BoxFit.fitWidth,
              // Altezza fissa per la parte superiore
              height: 265,
            ),
          ),

          // Contenuto principale scrollabile
          SingleChildScrollView(
            child: Container(
              // Riempie in larghezza
              width: double.infinity,
              // Il colore di sfondo scuro
              decoration: const BoxDecoration(
                color: Color.fromRGBO(21, 19, 22, 1),
              ),
              // Un po' di margine in alto per non sovrapporsi all'immagine
              margin: const EdgeInsets.only(top: 265),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titolo "Get Started"
                  const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromRGBO(239, 239, 239, 1),
                      fontFamily: 'Inter',
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo Email
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color.fromRGBO(163, 163, 163, 1),
                      fontFamily: 'Inter',
                      fontSize: 14.33,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(34, 34, 34, 0.2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Icons.email, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'youremail@example.com',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Campo Nome
                  const Text(
                    'Your Name',
                    style: TextStyle(
                      color: Color.fromRGBO(163, 163, 163, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.33,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(34, 34, 34, 0.2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Icons.person, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '@yourname',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Campo Password
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color.fromRGBO(163, 163, 163, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.33,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(34, 34, 34, 0.2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Icons.lock, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '********',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _togglePasswordVisibility,
                          icon: Icon(
                            _obscurePassword
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Bottone "Sign up"
                  GestureDetector(
                    onTap: _onSignUp,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment(0.98, 0.0),
                          end: Alignment(-0.01, 0.03),
                          colors: [
                            Color.fromRGBO(156, 63, 228, 1),
                            Color.fromRGBO(28, 32, 61, 1),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // "Or continue with"
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
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
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Icone Social (Google, Apple, Facebook)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google
                      GestureDetector(
                        onTap: _onSignUpWithGoogle,
                        child: Image.asset(
                          'lib/assets/images/goole.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 30),

                      // Facebook
                      GestureDetector(
                        onTap: _onSignUpWithFacebook,
                        child: Image.asset(
                          'lib/assets/images/facebook.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 30),

                      // Apple
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
}
