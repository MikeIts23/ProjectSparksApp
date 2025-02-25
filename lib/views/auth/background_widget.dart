import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  BackgroundWidgetState createState() => BackgroundWidgetState();
}

class BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator BackgroundWidget - GROUP
    return SizedBox(
      width: 904,
      height: 1037,
      child: Stack(
        children: <Widget>[
          // 1) Cerchio in basso a destra
          Positioned(
            top: 640,
            left: 430,
            child: Container(
              width: 397,
              height: 397,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(397, 397)),
                // Esempio di RadialGradient rossastro
                gradient: RadialGradient(
                  colors: [
                    Colors.red.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  radius: 0.85,
                ),
              ),
            ),
          ),

          // 2) Cerchio in basso a sinistra
          Positioned(
            top: 619,
            left: 0,
            child: Container(
              width: 397,
              height: 397,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(397, 397)),
                // Esempio di RadialGradient viola
                gradient: RadialGradient(
                  colors: [
                    Colors.purple.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  radius: 0.85,
                ),
              ),
            ),
          ),

          // 3) Rettangolo con angoli arrotondati al centro
          Positioned(
            top: 118,
            left: 213,
            child: Container(
              width: 447,
              height: 803,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(59),
                  topRight: Radius.circular(59),
                  bottomLeft: Radius.circular(59),
                  bottomRight: Radius.circular(59),
                ),
                // Esempio di gradiente viola/rosa chiaro
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple.withOpacity(0.2),
                    Colors.redAccent.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),

          // 4) Cerchio in alto a destra
          Positioned(
            top: 0,
            left: 507,
            child: Container(
              width: 397,
              height: 402.7425231933594,
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.all(Radius.elliptical(397, 402.74)),
                // Esempio di RadialGradient azzurro
                gradient: RadialGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  radius: 0.85,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
