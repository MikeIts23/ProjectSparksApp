import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Se prevedi di usare pacchetti per login social, importali qui (firebase_auth, google_sign_in, ecc.)

class LoginScreen1Widget extends StatefulWidget {
  const LoginScreen1Widget({Key? key}) : super(key: key);

  @override
  State<LoginScreen1Widget> createState() => _LoginScreen1WidgetState();
}

class _LoginScreen1WidgetState extends State<LoginScreen1Widget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignIn() {
    // Esempio: recupera i valori
    final username = _usernameController.text;
    final password = _passwordController.text;

    // TODO: Implementa la tua logica di autenticazione
    // Se l'utente è autenticato con successo, naviga nella tua home
    Navigator.pushNamed(context, '/'); // Esempio
  }

  void _onRegister() {
    // Vai alla schermata di registrazione
    Navigator.pushNamed(context, '/register');
  }

  void _onForgotPassword() {
    // TODO: Implementa eventuale flusso di reset password
    print('Forgot Password cliccato!');
  }

  // Esempi di handler per i login social
  void _onSignInWithGoogle() {
    // TODO: Implementa logica di autenticazione con Google
    print('Login con Google!');
  }

  void _onSignInWithApple() {
    // TODO: Implementa logica di autenticazione con Apple
    print('Login con Apple!');
  }

  void _onSignInWithFacebook() {
    // TODO: Implementa logica di autenticazione con Facebook
    print('Login con Facebook!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Rimuovo i bordi per avere uno schermo “pieno”, se desideri.
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(21, 19, 22, 1),
        ),
        child: Stack(
          children: <Widget>[
            // ---------------------------
            // Sfondo con immagine in alto
            // ---------------------------
            Positioned(
              top: -3,
              left: -4,
              child: SizedBox(
                width: 434,
                height: 323,
                child: Image.asset(
                  'assets/images/Illustration.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            // ---------------------------
            // Titolo e sottotitolo
            // ---------------------------
            const Positioned(
              top: 281,
              left: 55,
              child: SizedBox(
                width: 328,
                height: 69,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Sparky',
                      style: TextStyle(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        fontFamily: 'Inter',
                        fontSize: 40, // leggermente ridotta
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'welcome back we missed you',
                      style: TextStyle(
                        color: Color.fromRGBO(163, 163, 163, 1),
                        fontFamily: 'Inter',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Campo Username
            // ---------------------------
            const Positioned(
              top: 376,
              left: 58,
              child: Text(
                'Username',
                style: TextStyle(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              top: 409,
              left: 58,
              child: Container(
                width: 314,
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
            ),

            // ---------------------------
            // Campo Password
            // ---------------------------
            const Positioned(
              top: 476,
              left: 58,
              child: Text(
                'Password',
                style: TextStyle(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              top: 503,
              left: 59,
              child: Container(
                width: 314,
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
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: () {
                        // TODO: gestisci la visibilità password
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Link “Forgot Password?”
            // ---------------------------
            Positioned(
              top: 568,
              left: 272,
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

            // ---------------------------
            // Bottone "Sign in"
            // ---------------------------
            Positioned(
              top: 609,
              left: 65,
              child: GestureDetector(
                onTap: _onSignIn,
                child: Container(
                  width: 314,
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
            ),

            // ---------------------------
            // Separatore "OR"
            // ---------------------------
            const Positioned(
              top: 684,
              left: 208,
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
              ),
            ),

            // ---------------------------
            // Bottone "Register"
            // ---------------------------
            Positioned(
              top: 723,
              left: 65,
              child: GestureDetector(
                onTap: _onRegister,
                child: Container(
                  width: 314,
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
            ),

            // ---------------------------
            // “Or continue with”
            // ---------------------------
            const Positioned(
              top: 802,
              left: 95,
              child: SizedBox(
                width: 303,
                height: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Color.fromRGBO(181, 181, 181, 1),
                          fontSize: 11.25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Icone social (Google, Apple, Facebook)
            // ---------------------------
            Positioned(
              top: 836,
              left: 95,
              child: Row(
                children: [
                  // Google
                  GestureDetector(
                    onTap: _onSignInWithGoogle,
                    child: SizedBox(
                      width: 58,
                      height: 44,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/google_logo.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  // Facebook
                  GestureDetector(
                    onTap: _onSignInWithFacebook,
                    child: SizedBox(
                      width: 58,
                      height: 44,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/facebook_logo.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  // Apple
                  GestureDetector(
                    onTap: _onSignInWithApple,
                    child: SizedBox(
                      width: 58,
                      height: 44,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/apple_logo.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
