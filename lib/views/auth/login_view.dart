import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'background_widget.dart';

class LoginScreen1Widget extends StatefulWidget {
  const LoginScreen1Widget({Key? key}) : super(key: key);

  @override
  State<LoginScreen1Widget> createState() => _LoginScreen1WidgetState();
}

class _LoginScreen1WidgetState extends State<LoginScreen1Widget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Booleano per gestire la visibilità della password
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _onSignIn() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    // Esempio di logica di autenticazione
    Navigator.pushNamed(context, '/'); // Naviga alla home
  }

  void _onRegister() {
    Navigator.pushNamed(context, '/register');
  }

  void _onForgotPassword() {
    print('Forgot Password cliccato!');
  }

  // Handler login social
  void _onSignInWithGoogle() => print('Login con Google!');
  void _onSignInWithApple() => print('Login con Apple!');
  void _onSignInWithFacebook() => print('Login con Facebook!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1) BackgroundWidget dietro (copre tutto lo schermo)
          const Positioned.fill(
            child: BackgroundWidget(),
          ),

          Stack(
            children: [
              // Immagine in alto
              Positioned(
                top: -3,
                left: -4,
                child: SizedBox(
                  width: 434,
                  height: 323,
                  child: Image.asset(
                    'lib/assets/images/illustration1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              // Contenuto principale
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  // Tolto l'height: MediaQuery.of(context).size.height per evitare overflow
                  padding: const EdgeInsets.symmetric(horizontal: 58),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(21, 19, 22, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 280),

                      // Titolo
                      const Text(
                        'Welcome Sparky',
                        style: TextStyle(
                          color: Color.fromRGBO(239, 239, 239, 1),
                          fontFamily: 'Inter',
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'welcome back we missed you',
                        style: TextStyle(
                          color: Color.fromRGBO(163, 163, 163, 1),
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Campo Username
                      const Text(
                        'Username',
                        style: TextStyle(
                          color: Color.fromRGBO(163, 163, 163, 1),
                          fontSize: 14,
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
                            const SizedBox(width: 20),
                            const Icon(Icons.person, color: Colors.grey),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _usernameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
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
                          fontSize: 14,
                          fontFamily: 'Poppins',
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
                            const SizedBox(width: 20),
                            const Icon(Icons.lock, color: Colors.grey),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
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

                      // Bottone "Sign in"
                      GestureDetector(
                        onTap: _onSignIn,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment(0.98, 0.0),
                              end: Alignment(-0.01, 0.03),
                              colors: [
                                Color.fromRGBO(156, 63, 228, 1),
                                Color.fromRGBO(28, 32, 61, 1)
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),
                      const Center(
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Bottone "Register"
                      GestureDetector(
                        onTap: _onRegister,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment(0.98, 0.0),
                              end: Alignment(-0.01, 0.03),
                              colors: [
                                Color.fromRGBO(156, 63, 228, 1),
                                Color.fromRGBO(28, 32, 61, 1)
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
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

                      // “Or continue with” + social icons
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

                      // Social icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _onSignInWithGoogle,
                            child: Image.asset(
                              'lib/assets/images/google.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: _onSignInWithFacebook,
                            child: Image.asset(
                              'lib/assets/images/facebook.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: _onSignInWithApple,
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
        ],
      ),
    );
  }
}
