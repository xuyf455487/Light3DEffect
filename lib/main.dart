import 'package:flutter/material.dart';
import 'pages/light_effect_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D Demo',
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                color: Colors.black,
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/images/face.webp',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Center(
              child: Light3DEffect(
                size: 300,
                imagePath: 'assets/images/face.webp',
                indicatorSize: 25,
                indicatorBorderWidth: 1,
                lightType: LightType.radial,
                lightIntensity: 0.7,
                darkIntensity: 0.3,
                onPositionChanged: (x, y) {
                  print('x: $x, y: $y');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
