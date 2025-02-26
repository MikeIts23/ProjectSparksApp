import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utilizziamo un background con gradiente
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1C203D), // Colore superiore: un nero profondo
              Color(0xFF4B56A3), // Colore inferiore: un viola scuro
            ],
          ),
          // Arrotondamento dei bordi inferiori
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FRECCIA BACK + TITOLO
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/images/vector.svg', // icona back
                        width: 35,
                        height: 35,
                        // Puoi specificare il colore se necessario, ad esempio: color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 32,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // BLOCCO 1: Types of Data We Collect
                const Text(
                  '1. Types of Data We Collect',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    letterSpacing: 0.1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '''Our mobile application collects only the data that is essential for providing and enhancing our services. This includes:
• Personal data such as your name, email address, and phone number when you voluntarily provide it.
• Technical data such as device information, IP address, operating system details, and usage statistics.
• Location data, if you grant permission, to deliver location-based services.
All data collection practices are conducted in strict compliance with the GDPR and other applicable data protection regulations.''',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0.25,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // BLOCCO 2: Use of Your Personal Data
                const Text(
                  '2. Use of Your Personal Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    letterSpacing: 0.1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '''We use your personal data for a variety of purposes including:
• Providing, maintaining, and improving our services.
• Personalizing your experience and offering customer support.
• Analyzing usage trends to enhance functionality and user satisfaction.
• Communicating updates, promotions, and other relevant information.
All processing activities are performed in accordance with GDPR requirements and international data protection standards, ensuring that your privacy is protected.''',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0.25,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // BLOCCO 3: Disclosure of Your Personal Data
                const Text(
                  '3. Disclosure of Your Personal Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    letterSpacing: 0.1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '''We will not sell or rent your personal data. We may share your data only with:
• Trusted third-party service providers who assist in delivering our services, under strict confidentiality and data protection agreements.
• Regulatory or governmental authorities when legally required to do so.
• Business partners with whom we have entered into a joint venture, provided that the disclosure complies with all applicable data protection laws.
All data disclosures are governed by strict contractual and technical safeguards, ensuring compliance with GDPR and other international data protection legislation.''',
                  style: TextStyle(
                    color: Colors.white,
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
      ),
    );
  }
}
