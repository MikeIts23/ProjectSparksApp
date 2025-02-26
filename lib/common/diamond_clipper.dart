import 'package:flutter/material.dart';

class Polygon1Widget extends StatefulWidget {
  const Polygon1Widget({Key? key}) : super(key: key);

  @override
  _Polygon1WidgetState createState() => _Polygon1WidgetState();
}

class _Polygon1WidgetState extends State<Polygon1Widget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/polygon.png', // Percorso dell'immagine
      fit: BoxFit.contain,
      // Altre proprietà se vuoi
    );
  }
}
