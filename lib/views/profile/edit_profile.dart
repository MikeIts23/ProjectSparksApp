import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controller per i vari campi di testo
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Dropdown per la lista Paesi (esempio ridotto)
  String? _selectedCountry;
  final List<String> _countries = [
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Italy',
    'France',
    'Germany',
    'Spain',
    'Japan',
    'China',
    // Aggiungi qui tutte le altre nazioni...
  ];

  // Dropdown per il Genere
  String? _selectedGenre;
  final List<String> _genres = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    // 1) Abilita modalità edgeToEdge
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 2) Imposta barre di sistema trasparenti, icone bianche
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sfondo trasparente: disegniamo tutto nel Stack
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          // ---------- SFONDO GRADIENTE ----------
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4B56A3), // In alto
                    Color(0xFF1C203D), // In basso
                  ],
                ),
              ),
            ),
          ),

          // ---------- CONTENUTO PRINCIPALE ----------
          // SafeArea con bottom: false per non riservare spazio in fondo
          SafeArea(
            top: true,
            left: true,
            right: true,
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- FRECCIA BACK + TITOLO ----------
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/images/vector.svg', // icona back
                          width: 35,
                          height: 35,
                          color: Colors.white, // Freccia bianca
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Edit profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ---------- FULL NAME ----------
                  _buildTextField(
                    controller: _fullNameController,
                    label: 'Full name',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),

                  // ---------- NICK NAME ----------
                  _buildTextField(
                    controller: _nickNameController,
                    label: 'Nick name',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),

                  // ---------- LABEL (EMAIL) ----------
                  _buildTextField(
                    controller: _emailController,
                    label: 'Label (Email)',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // ---------- PHONE NUMBER ----------
                  _buildTextField(
                    controller: _phoneNumberController,
                    label: 'Phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  // ---------- COUNTRY (DROPDOWN) ----------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.black,
                      value: _selectedCountry,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      items: _countries.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(
                            country,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ---------- GENRE (DROPDOWN) ----------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.black,
                      value: _selectedGenre,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Genre',
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      items: _genres.map((genre) {
                        return DropdownMenuItem(
                          value: genre,
                          child: Text(
                            genre,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGenre = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ---------- ADDRESS ----------
                  _buildTextField(
                    controller: _addressController,
                    label: 'Address',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 32),

                  // ---------- SUBMIT BUTTON ----------
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 184, 255, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'SUBMIT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(32, 32, 32, 1),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  // Spazio extra in fondo
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper per generare i TextField con lo stesso stile
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
