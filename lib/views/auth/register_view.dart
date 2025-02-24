import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loginscreen3Widget extends StatefulWidget {
  const Loginscreen3Widget({Key? key}) : super(key: key);

  @override
  Loginscreen3WidgetState createState() => Loginscreen3WidgetState();
}

class Loginscreen3WidgetState extends State<Loginscreen3Widget> {
  // Controller per i campi di testo
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Esempio di funzione di registrazione
  void _onSignUp() async {
    final email = _emailController.text;
    final name = _nameController.text;
    final password = _passwordController.text;

    // TODO: Qui puoi inserire la logica di registrazione su Firebase
    // o salvataggio con SharedPreferences, ecc.
    // Esempio:
    /*
      try {
        // con Firebase Auth:
        UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
        // Poi magari salvi "name" come displayName o su un database
      } catch(e) {
        print('Errore durante la registrazione: $e');
      }
    */

    // Se va tutto bene, navighi alla schermata principale (home)
    Navigator.pushNamed(context, '/');
  }

  // Esempio di handler per i social login
  void _onSignUpWithGoogle() {
    // TODO: logica di social login con Google
    print('Sign up con Google');
  }

  void _onSignUpWithApple() {
    // TODO: logica di social login con Apple
    print('Sign up con Apple');
  }

  void _onSignUpWithFacebook() {
    // TODO: logica di social login con Facebook
    print('Sign up con Facebook');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Preferibile usare dimensioni flessibili, ma qui manteniamo
        // i valori di Figma come da codice originale
        width: 430,
        height: 932,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: const Color.fromRGBO(21, 19, 22, 1),
        ),
        child: Stack(
          children: <Widget>[
            // ---------------------------
            // Immagine di sfondo in alto
            // ---------------------------
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: 439,
                height: 265,
                child: Image.asset(
                  'assets/images/Illustration.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            // ---------------------------
            // Sfondo delle forme colorate (effetti circolari)
            // ---------------------------
            Positioned(
              top: 250,
              left: -221,
              child: SizedBox(
                width: 827,
                height: 919,
                child: Stack(
                  children: <Widget>[
                    // Queste sono figure decorative
                    // (cerchi giganti e contenitori con borderRadius),
                    // puoi lasciare così se vuoi mantenere l'estetica di Figma.
                    Positioned(
                      top: 522,
                      left: 430,
                      child: Container(
                        width: 397,
                        height: 397,
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(397, 397)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 501,
                      left: 0,
                      child: Container(
                        width: 397,
                        height: 397,
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(397, 397)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 213,
                      child: Container(
                        width: 447,
                        height: 803,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(59),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Titolo "Get Started"
            // ---------------------------
            const Positioned(
              top: 281,
              left: 103,
              child: SizedBox(
                width: 226,
                height: 49,
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color.fromRGBO(239, 239, 239, 1),
                    fontFamily: 'Inter',
                    fontSize: 40.328765869140625,
                  ),
                ),
              ),
            ),

            // ---------------------------
            // Etichetta "Email"
            // ---------------------------
            const Positioned(
              top: 383,
              left: 67,
              child: Text(
                'Email ',
                style: TextStyle(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  fontFamily: 'Inter',
                  fontSize: 14.33,
                ),
              ),
            ),

            // Campo di testo Email
            Positioned(
              top: 418,
              left: 66,
              child: Container(
                width: 314,
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
            ),

            // ---------------------------
            // Etichetta "Your Name"
            // ---------------------------
            const Positioned(
              top: 491,
              left: 67,
              child: Text(
                'Your Name',
                style: TextStyle(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  fontFamily: 'Poppins',
                  fontSize: 14.33,
                ),
              ),
            ),

            // Campo di testo Nome
            Positioned(
              top: 535,
              left: 66,
              child: Container(
                width: 314,
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
            ),

            // ---------------------------
            // Etichetta "Password"
            // ---------------------------
            const Positioned(
              top: 614,
              left: 69,
              child: Text(
                'Password',
                style: TextStyle(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  fontFamily: 'Poppins',
                  fontSize: 14.33,
                ),
              ),
            ),

            // Testo "Strong" a destra (indicativo)
            const Positioned(
              top: 673,
              left: 339,
              child: Text(
                'Strong',
                style: TextStyle(
                  color: Color.fromRGBO(158, 218, 161, 1),
                  fontFamily: 'Inter',
                  fontSize: 10.45,
                ),
              ),
            ),

            // Campo di testo Password
            Positioned(
              top: 652,
              left: 69,
              child: Container(
                width: 314,
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
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '********',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: gestire la visibilità della password
                      },
                      icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Bottone "Sign up"
            // ---------------------------
            Positioned(
              top: 737,
              left: 66,
              child: GestureDetector(
                onTap: _onSignUp,
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
            ),

            // ---------------------------
            // "Or continue with"
            // ---------------------------
            const Positioned(
              top: 815,
              left: 67,
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
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // Icone Social (Google, Apple, Facebook)
            // ---------------------------
            Positioned(
              top: 854,
              left: 97,
              child: Row(
                children: [
                  // Google
                  GestureDetector(
                    onTap: _onSignUpWithGoogle,
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
                    onTap: _onSignUpWithFacebook,
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
                    onTap: _onSignUpWithApple,
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
