# Flutter 3D Light Effect

A Flutter widget for creating interactive 3D lighting effects, providing an immersive visual experience with customizable light sources and dynamic shadows.

## Features

- Two lighting modes: parallel and radial lighting
- Interactive light source position control
- Customizable lighting parameters (intensity, radius, etc.)
- Beautiful light source indicator and guide lines
- Adjustable dark areas
- Circular border effect

## Installation

Add this dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_3d_effect: ^1.0.0
```

## Usage

### Basic Usage

The simplest way to use the widget:

```dart
Light3DEffect(
  size: 300,
  imagePath: 'assets/images/your_image.png',
)
```

### Advanced Usage

Example with full customization:

```dart
Light3DEffect(
  size: 300,
  imagePath: 'assets/images/your_image.png',
  backgroundColor: Colors.black,
  lightType: LightType.parallel,
  lightIntensity: 0.95,
  lightRadius: 0.8,
  darkIntensity: 0.2,
  showIndicator: true,
  indicatorSize: 24,
  showIndicatorLine: true,
  showBorder: true,
  onPositionChanged: (x, y) {
    print('Light position changed: ($x, $y)');
  },
)
```

## Parameters

### Basic Parameters
- `size`: Widget size (square)
- `imagePath`: Path to the image resource
- `backgroundColor`: Background color of the widget

### Light Parameters
- `lightType`: Type of light source (parallel/radial)
- `lightIntensity`: Intensity of the light effect (0.0 to 1.0)
- `lightRadius`: Radius of the light effect (0.0 to 1.0)
- `darkIntensity`: Intensity of dark areas (0.0 to 1.0)

### Indicator Parameters
- `showIndicator`: Toggle light source indicator visibility
- `indicatorSize`: Size of the light source indicator
- `indicatorColor`: Color of the light source indicator
- `indicatorOpacity`: Opacity of the light source indicator

### Guide Line Parameters
- `showIndicatorLine`: Toggle guide line visibility
- `indicatorLineColor`: Color of the guide line
- `indicatorLineWidth`: Width of the guide line
- `indicatorLineDashWidth`: Width of guide line dashes
- `indicatorLineDashSpace`: Space between guide line dashes

### Border Parameters
- `showBorder`: Toggle border visibility
- `borderColor`: Color of the border
- `borderWidth`: Width of the border

## Setup

1. Add the widget to your project
2. Configure image assets in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```

## Implementation Example

Here's a complete example showing how to implement the 3D light effect in your app:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Light3DEffect(
            size: 300,
            imagePath: 'assets/images/sample.png',
            lightType: LightType.parallel,
            lightIntensity: 0.95,
            onPositionChanged: (x, y) {
              print('Light position: ($x, $y)');
            },
          ),
        ),
      ),
    );
  }
}
```

## Notes

1. The widget maintains a square aspect ratio (width equals height)
2. Light source position can be adjusted by dragging
3. Image resources must be properly configured in `pubspec.yaml`
4. The widget works best with images that have clear subjects and good contrast

## Contributing

Contributions are welcome! If you find a bug or want to add a new feature:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 