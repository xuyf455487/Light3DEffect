# Flutter 3D Light Effect / Flutter 3D光效

一个用于创建交互式3D光影效果的Flutter组件。
A Flutter widget for creating interactive 3D lighting effects.

## 功能特点 / Features

- 支持平行光和辐射光两种光照模式 / Supports both parallel and radial lighting modes
- 可交互的光源位置控制 / Interactive light source position control
- 可自定义的光照参数（强度、半径等）/ Customizable lighting parameters (intensity, radius, etc.)
- 美观的光源指示器和指示线 / Beautiful light source indicator and guide lines
- 支持暗部调节 / Adjustable dark areas
- 圆形边框效果 / Circular border effect

## 使用方法 / Usage

### 基础用法 / Basic Usage

```dart
Light3DEffect(
  size: 300,
  imagePath: 'assets/images/your_image.png',
)
```

### 完整参数示例 / Full Parameters Example

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

## 参数说明 / Parameters

### 基础参数 / Basic Parameters
- `size`: 组件大小 / Widget size
- `imagePath`: 图片路径 / Image path
- `backgroundColor`: 背景颜色 / Background color

### 光照参数 / Light Parameters
- `lightType`: 光照类型（平行光/辐射光）/ Light type (parallel/radial)
- `lightIntensity`: 光照强度 / Light intensity
- `lightRadius`: 光照半径 / Light radius
- `darkIntensity`: 暗部强度 / Dark intensity

### 指示器参数 / Indicator Parameters
- `showIndicator`: 是否显示光源指示器 / Show light source indicator
- `indicatorSize`: 指示器大小 / Indicator size
- `indicatorColor`: 指示器颜色 / Indicator color
- `indicatorOpacity`: 指示器透明度 / Indicator opacity

### 指示线参数 / Guide Line Parameters
- `showIndicatorLine`: 是否显示指示线 / Show guide line
- `indicatorLineColor`: 指示线颜色 / Guide line color
- `indicatorLineWidth`: 指示线宽度 / Guide line width

### 边框参数 / Border Parameters
- `showBorder`: 是否显示边框 / Show border
- `borderColor`: 边框颜色 / Border color
- `borderWidth`: 边框宽度 / Border width

## 注意事项 / Notes

1. 图片资源需要在 pubspec.yaml 中正确配置 / Image resources need to be properly configured in pubspec.yaml
2. 组件大小为正方形，宽高相等 / The widget is square, width equals height
3. 光源位置可通过拖动进行调整 / Light source position can be adjusted by dragging

## 示例 / Example

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Light3DEffect(
            size: 300,
            imagePath: 'assets/images/sample.png',
          ),
        ),
      ),
    ),
  );
}
```

## 许可证 / License

MIT License
