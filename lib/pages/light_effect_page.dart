import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:async';

/// 3D光效组件
/// 实现带有可交互光源的3D光影效果
/// 3D Light Effect Widget
/// Implements 3D lighting effects with interactive light source
class Light3DEffect extends StatefulWidget {
  // 组件的大小，宽高相等
  // Size of the widget, width equals height
  final double size;

  // 要显示的图片路径
  // Path of the image to display
  final String imagePath;

  // 背景颜色，默认为黑色
  // Background color, defaults to black
  final Color backgroundColor;

  // 光源指示器的大小，默认24
  // Size of the light source indicator, defaults to 24
  final double indicatorSize;

  // 光源指示器的边框宽度，默认2
  // Border width of the light source indicator, defaults to 2
  final double indicatorBorderWidth;

  // 光源指示器的颜色，默认白色
  // Color of the light source indicator, defaults to white
  final Color indicatorColor;

  // 光源指示器的透明度，默认0.3
  // Opacity of the light source indicator, defaults to 0.3
  final double indicatorOpacity;

  // 是否显示光源指示器，默认true
  // Whether to show the light source indicator, defaults to true
  final bool showIndicator;

  // 光照类型，默认为平行光
  // Light type, defaults to parallel light
  final LightType lightType;

  // 光照强度，默认0.95
  // Light intensity, defaults to 0.95
  final double lightIntensity;

  // 光照半径，默认0.8
  // Light radius, defaults to 0.8
  final double lightRadius;

  // 光照渐变颜色，默认[Colors.white, Colors.white, Colors.white, Colors.transparent]
  // Light gradient colors, defaults to [Colors.white, Colors.white, Colors.white, Colors.transparent]
  final List<Color> lightGradientColors;

  // 光照渐变位置，默认[0.0, 0.2, 0.6, 1.0]
  // Light gradient stops, defaults to [0.0, 0.2, 0.6, 1.0]
  final List<double> lightGradientStops;

  // 暗部强度，默认0.2
  // Dark intensity, defaults to 0.2
  final double darkIntensity;

  // 是否显示指示线，默认true
  // Whether to show indicator line, defaults to true
  final bool showIndicatorLine;

  // 指示线颜色，默认白色
  // Indicator line color, defaults to white
  final Color indicatorLineColor;

  // 指示线宽度，默认1.5
  // Indicator line width, defaults to 1.5
  final double indicatorLineWidth;

  // 指示线虚线宽度，默认4.0
  // Indicator line dash width, defaults to 4.0
  final double indicatorLineDashWidth;

  // 指示线虚线间距，默认4.0
  // Indicator line dash space, defaults to 4.0
  final double indicatorLineDashSpace;

  // 是否显示边框，默认true
  // Whether to show border, defaults to true
  final bool showBorder;

  // 边框颜色，默认白色
  // Border color, defaults to white
  final Color borderColor;

  // 边框宽度，默认1.0
  // Border width, defaults to 1.0
  final double borderWidth;

  // 坐标变化回调
  // Position change callback
  final void Function(double x, double y)? onPositionChanged;

  /// 构造函数
  /// @param size - 组件大小，默认300
  /// @param imagePath - 图片路径，必需参数
  /// @param backgroundColor - 背景颜色，默认黑色
  /// @param indicatorSize - 光源指示器大小，默认24
  /// @param indicatorBorderWidth - 光源指示器边框宽度，默认2
  /// @param indicatorColor - 光源指示器颜色，默认白色
  /// @param indicatorOpacity - 光源指示器透明度，默认0.3
  /// @param showIndicator - 是否显示光源指示器，默认true
  /// @param lightType - 光照类型，默认为平行光
  /// @param lightIntensity - 光照强度，默认0.95
  /// @param lightRadius - 光照半径，默认0.8
  /// @param lightGradientColors - 光照渐变颜色，默认[Colors.white, Colors.white, Colors.white, Colors.transparent]
  /// @param lightGradientStops - 光照渐变位置，默认[0.0, 0.2, 0.6, 1.0]
  /// @param darkIntensity - 暗部强度，默认0.2
  /// @param showIndicatorLine - 是否显示指示线，默认true
  /// @param indicatorLineColor - 指示线颜色，默认白色
  /// @param indicatorLineWidth - 指示线宽度，默认1.5
  /// @param indicatorLineDashWidth - 指示线虚线宽度，默认4.0
  /// @param indicatorLineDashSpace - 指示线虚线间距，默认4.0
  /// @param showBorder - 是否显示边框，默认true
  /// @param borderColor - 边框颜色，默认白色
  /// @param borderWidth - 边框宽度，默认1.0
  /// @param onPositionChanged - 坐标变化回调
  const Light3DEffect({
    super.key,
    this.size = Light3DConfig.defaultSize,
    required this.imagePath,
    this.backgroundColor = Light3DConfig.defaultBackgroundColor,
    this.indicatorSize = Light3DConfig.defaultIndicatorSize,
    this.indicatorBorderWidth = Light3DConfig.defaultIndicatorBorderWidth,
    this.indicatorColor = Light3DConfig.defaultIndicatorColor,
    this.indicatorOpacity = Light3DConfig.defaultIndicatorOpacity,
    this.showIndicator = Light3DConfig.defaultShowIndicator,
    this.lightType = Light3DConfig.defaultLightType,
    this.lightIntensity = Light3DConfig.defaultLightIntensity,
    this.lightRadius = Light3DConfig.defaultLightRadius,
    this.lightGradientColors = Light3DConfig.defaultLightGradientColors,
    this.lightGradientStops = Light3DConfig.defaultLightGradientStops,
    this.darkIntensity = Light3DConfig.defaultDarkIntensity,
    this.showIndicatorLine = Light3DConfig.defaultShowIndicatorLine,
    this.indicatorLineColor = Light3DConfig.defaultIndicatorLineColor,
    this.indicatorLineWidth = Light3DConfig.defaultIndicatorLineWidth,
    this.indicatorLineDashWidth = Light3DConfig.defaultIndicatorLineDashWidth,
    this.indicatorLineDashSpace = Light3DConfig.defaultIndicatorLineDashSpace,
    this.showBorder = Light3DConfig.defaultShowBorder,
    this.borderColor = Light3DConfig.defaultBorderColor,
    this.borderWidth = Light3DConfig.defaultBorderWidth,
    this.onPositionChanged,
  });

  @override
  State<Light3DEffect> createState() => _Light3DEffectState();
}

/// 光照类型枚举
/// Light type enumeration
enum LightType {
  // 平行光
  // Parallel light
  parallel,
  // 辐射光
  // Radial light
  radial,
}

/// 3D光效配置参数
/// 3D light effect configuration parameters
class Light3DConfig {
  /// 基础参数 / Basic parameters
  static const double defaultSize = 300.0; // 默认组件大小 / Default widget size
  static const Color defaultBackgroundColor =
      Colors.black; // 默认背景色 / Default background color

  /// 指示器参数 / Indicator parameters
  static const double defaultIndicatorSize =
      24.0; // 默认指示器大小 / Default indicator size
  static const double defaultIndicatorBorderWidth =
      2.0; // 默认指示器边框宽度 / Default indicator border width
  static const Color defaultIndicatorColor =
      Colors.white; // 默认指示器颜色 / Default indicator color
  static const double defaultIndicatorOpacity =
      0.3; // 默认指示器透明度 / Default indicator opacity
  static const bool defaultShowIndicator =
      true; // 默认是否显示指示器 / Default show indicator flag

  /// 光照参数 / Light parameters
  static const LightType defaultLightType =
      LightType.parallel; // 默认光照类型 / Default light type
  static const double defaultLightIntensity =
      0.95; // 默认光照强度 / Default light intensity
  static const double defaultLightRadius = 0.8; // 默认光照半径 / Default light radius
  static const List<Color> defaultLightGradientColors = [
    // 默认光照渐变颜色 / Default light gradient colors
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.transparent,
  ];
  static const List<double> defaultLightGradientStops = [
    // 默认光照渐变位置 / Default light gradient stops
    0.0,
    0.2,
    0.6,
    1.0
  ];

  /// 暗部参数 / Dark parameters
  static const double defaultDarkIntensity =
      0.2; // 默认暗部强度 / Default dark intensity

  /// 指示线参数 / Indicator line parameters
  static const bool defaultShowIndicatorLine =
      true; // 默认是否显示指示线 / Default show indicator line flag
  static const Color defaultIndicatorLineColor =
      Colors.white; // 默认指示线颜色 / Default indicator line color
  static const double defaultIndicatorLineWidth =
      1.5; // 默认指示线宽度 / Default indicator line width
  static const double defaultIndicatorLineDashWidth =
      4.0; // 默认指示线虚线宽度 / Default indicator line dash width
  static const double defaultIndicatorLineDashSpace =
      4.0; // 默认指示线虚线间距 / Default indicator line dash space

  /// 边框参数 / Border parameters
  static const bool defaultShowBorder =
      true; // 默认是否显示边框 / Default show border flag
  static const Color defaultBorderColor =
      Colors.white; // 默认边框颜色 / Default border color
  static const double defaultBorderWidth = 1.0; // 默认边框宽度 / Default border width

  /// 光源初始位置 / Initial light position
  static const double defaultInitialLightX =
      -0.7; // 默认光源X坐标 / Default light X coordinate
  static const double defaultInitialLightY =
      -0.7; // 默认光源Y坐标 / Default light Y coordinate
  static const double defaultInitialLightPositionRatio =
      0.15; // 默认光源位置比例 / Default light position ratio
}

/// 3D光效组件的状态类
class _Light3DEffectState extends State<Light3DEffect> {
  // 加载的图片对象
  ui.Image? _image;

  // 用于获取组件大小的key
  final GlobalKey _containerKey = GlobalKey();

  // 光源在屏幕上的实际位置
  Offset? _lightPosition;

  // 光源的X坐标（-1到1）
  late double _lightX;

  // 光源的Y坐标（-1到1）
  late double _lightY;

  @override
  void initState() {
    super.initState();
    // 设置初始光源位置
    _lightX = -0.7;
    _lightY = -0.7;
    // 加载图片资源
    _loadImage();
    // 初始化光源位置
    _initLightPosition();
  }

  /// 初始化光源位置
  /// 在布局完成后设置光源的初始位置
  void _initLightPosition() {
    // 等待布局完成后执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // 设置光源位置在左上角
      _updateLightPosition(Offset(
        widget.size * 0.15, // 左上角X坐标
        widget.size * 0.15, // 左上角Y坐标
      ));
    });
  }

  /// 加载图片资源
  /// 异步加载图片并更新状态
  Future<void> _loadImage() async {
    // 创建图片提供者
    final ImageProvider provider = AssetImage(widget.imagePath);
    // 解析图片配置
    final ImageStream stream = provider.resolve(ImageConfiguration.empty);
    // 创建完成器
    final Completer<ui.Image> completer = Completer<ui.Image>();

    // 添加图片加载监听器
    stream.addListener(ImageStreamListener(
      // 图片加载成功回调
      (ImageInfo info, bool _) => completer.complete(info.image),
      // 图片加载失败回调
      onError: (dynamic error, StackTrace? stackTrace) {
        debugPrint('Error loading image: $error');
        completer.completeError(error);
      },
    ));

    try {
      // 等待图片加载完成
      final image = await completer.future;
      // 更新状态
      setState(() => _image = image);
    } catch (e) {
      debugPrint('Failed to load image: $e');
    }
  }

  /// 更新光源位置
  /// @param position - 新的光源位置
  void _updateLightPosition(Offset position) {
    // 计算中心点和半径
    final center = Offset(widget.size / 2, widget.size / 2);
    final radius = widget.size / 3;

    // 计算点击位置到中心的距离和角度
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    final distance = math.sqrt(dx * dx + dy * dy);
    final angle = math.atan2(dy, dx);

    // 如果超出范围，调整到圆形边界上
    final adjustedPosition = distance > radius
        ? Offset(
            center.dx + radius * math.cos(angle),
            center.dy + radius * math.sin(angle),
          )
        : position;

    // 更新状态
    setState(() {
      _lightPosition = adjustedPosition;
      // 将位置转换为-1到1的范围
      _lightX = (adjustedPosition.dx - center.dx) / radius;
      _lightY = (adjustedPosition.dy - center.dy) / radius;

      // 触发回调
      widget.onPositionChanged?.call(_lightX, _lightY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      width: widget.size,
      height: widget.size,
      color: widget.backgroundColor,
      child: GestureDetector(
        onPanDown: (details) => _updateLightPosition(details.localPosition),
        onPanUpdate: (details) => _updateLightPosition(details.localPosition),
        child: CustomPaint(
          painter: _Light3DPainter(
            image: _image,
            lightX: _lightX,
            lightY: _lightY,
            lightType: widget.lightType,
            lightIntensity: widget.lightIntensity,
            lightRadius: widget.lightRadius,
            lightGradientColors: widget.lightGradientColors,
            lightGradientStops: widget.lightGradientStops,
            darkIntensity: widget.darkIntensity,
            showIndicatorLine: widget.showIndicatorLine,
            indicatorLineColor: widget.indicatorLineColor,
            indicatorLineWidth: widget.indicatorLineWidth,
            indicatorLineDashWidth: widget.indicatorLineDashWidth,
            indicatorLineDashSpace: widget.indicatorLineDashSpace,
            showBorder: widget.showBorder,
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            showIndicator: widget.showIndicator,
            indicatorSize: widget.indicatorSize,
            indicatorBorderWidth: widget.indicatorBorderWidth,
            indicatorColor: widget.indicatorColor,
            indicatorOpacity: widget.indicatorOpacity,
          ),
        ),
      ),
    );
  }
}

/// 3D光效绘制器
/// 负责实现具体的光影效果绘制
class _Light3DPainter extends CustomPainter {
  final ui.Image? image;
  final double lightX;
  final double lightY;
  final LightType lightType;
  final double lightIntensity;
  final double lightRadius;
  final List<Color> lightGradientColors;
  final List<double> lightGradientStops;
  final double darkIntensity;
  final bool showIndicatorLine;
  final Color indicatorLineColor;
  final double indicatorLineWidth;
  final double indicatorLineDashWidth;
  final double indicatorLineDashSpace;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;
  final bool showIndicator;
  final double indicatorSize;
  final double indicatorBorderWidth;
  final Color indicatorColor;
  final double indicatorOpacity;

  _Light3DPainter({
    required this.image,
    required this.lightX,
    required this.lightY,
    this.lightType = LightType.parallel,
    this.lightIntensity = Light3DConfig.defaultLightIntensity,
    this.lightRadius = Light3DConfig.defaultLightRadius,
    this.lightGradientColors = Light3DConfig.defaultLightGradientColors,
    this.lightGradientStops = Light3DConfig.defaultLightGradientStops,
    this.darkIntensity = Light3DConfig.defaultDarkIntensity,
    this.showIndicatorLine = Light3DConfig.defaultShowIndicatorLine,
    this.indicatorLineColor = Light3DConfig.defaultIndicatorLineColor,
    this.indicatorLineWidth = Light3DConfig.defaultIndicatorLineWidth,
    this.indicatorLineDashWidth = Light3DConfig.defaultIndicatorLineDashWidth,
    this.indicatorLineDashSpace = Light3DConfig.defaultIndicatorLineDashSpace,
    this.showBorder = Light3DConfig.defaultShowBorder,
    this.borderColor = Light3DConfig.defaultBorderColor,
    this.borderWidth = Light3DConfig.defaultBorderWidth,
    this.showIndicator = Light3DConfig.defaultShowIndicator,
    this.indicatorSize = Light3DConfig.defaultIndicatorSize,
    this.indicatorBorderWidth = Light3DConfig.defaultIndicatorBorderWidth,
    this.indicatorColor = Light3DConfig.defaultIndicatorColor,
    this.indicatorOpacity = Light3DConfig.defaultIndicatorOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.3;

    // 保存初始画布状态
    canvas.save();

    final clipPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.clipPath(clipPath);

    final src =
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble());
    final dst = Rect.fromCircle(center: center, radius: radius);

    // 1. 绘制暗色基础层
    canvas.drawImageRect(
      image!,
      src,
      dst,
      Paint()
        ..colorFilter = ColorFilter.matrix([
          darkIntensity,
          0,
          0,
          0,
          0,
          0,
          darkIntensity,
          0,
          0,
          0,
          0,
          0,
          darkIntensity,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
    );

    // 2. 创建光照效果
    canvas.saveLayer(dst, Paint());

    final lightPaint = Paint();

    if (lightType == LightType.radial) {
      final lightPos = Offset(
        center.dx + lightX * radius,
        center.dy + lightY * radius,
      );

      final radialGradient = RadialGradient(
        center: Alignment(lightX, lightY),
        radius: lightRadius,
        colors: lightGradientColors
            .map((color) => color.withOpacity(color.opacity * lightIntensity))
            .toList(),
        stops: lightGradientStops,
      ).createShader(dst);

      lightPaint
        ..shader = radialGradient
        ..blendMode = BlendMode.screen;
    } else {
      final lightGradient = LinearGradient(
        begin: Alignment(lightX, lightY),
        end: Alignment(-lightX, -lightY),
        colors: lightGradientColors
            .map((color) => color.withOpacity(color.opacity * lightIntensity))
            .toList(),
        stops: lightGradientStops,
      ).createShader(dst);

      lightPaint
        ..shader = lightGradient
        ..blendMode = BlendMode.screen;
    }

    canvas.drawRect(dst, lightPaint);

    // 在光照区域绘制原图
    canvas.drawImageRect(
      image!,
      src,
      dst,
      Paint()
        ..blendMode = BlendMode.srcIn
        ..colorFilter = ColorFilter.matrix([
          1 + lightIntensity * 0.1,
          0,
          0,
          0,
          0,
          0,
          1 + lightIntensity * 0.1,
          0,
          0,
          0,
          0,
          0,
          1 + lightIntensity * 0.1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
    );

    canvas.restore();

    // 绘制边框
    if (showBorder) {
      _drawBorder(canvas, center, radius);
    }

    // 恢复到初始画布状态，这样后续绘制不会被裁剪
    canvas.restore();

    // 绘制指示线和光源指示器
    if (showIndicatorLine) {
      _drawIndicatorLine(canvas, center, radius);
    }
    if (showIndicator) {
      _drawLightIndicator(canvas, center, radius);
    }
  }

  void _drawIndicatorLine(Canvas canvas, Offset center, double radius) {
    final lineStart = center;
    final lineEnd = Offset(
      center.dx + lightX * radius,
      center.dy + lightY * radius,
    );

    final linePaint = Paint()
      ..color = indicatorLineColor.withOpacity(0.4)
      ..strokeWidth = indicatorLineWidth
      ..style = PaintingStyle.stroke;

    final distance = (lineEnd - lineStart).distance;
    final dashCount =
        (distance / (indicatorLineDashWidth + indicatorLineDashSpace)).floor();

    final dx = (lineEnd.dx - lineStart.dx) / dashCount;
    final dy = (lineEnd.dy - lineStart.dy) / dashCount;

    for (var i = 0; i < dashCount; i++) {
      final startX = lineStart.dx + dx * i;
      final startY = lineStart.dy + dy * i;
      final endX = startX + dx * 0.5;
      final endY = startY + dy * 0.5;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        linePaint,
      );
    }
  }

  void _drawBorder(Canvas canvas, Offset center, double radius) {
    if (!showBorder) return;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = borderColor.withOpacity(0.8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth,
    );
  }

  void _drawLightIndicator(Canvas canvas, Offset center, double radius) {
    final lightPos = Offset(
      center.dx + lightX * radius,
      center.dy + lightY * radius,
    );

    // 绘制指示器背景
    canvas.drawCircle(
      lightPos,
      indicatorSize / 2,
      Paint()
        ..color = indicatorColor.withOpacity(indicatorOpacity)
        ..style = PaintingStyle.fill,
    );

    // 绘制指示器边框
    canvas.drawCircle(
      lightPos,
      indicatorSize / 2,
      Paint()
        ..color = indicatorColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = indicatorBorderWidth,
    );

    // 绘制发光效果
    canvas.drawCircle(
      lightPos,
      indicatorSize / 2,
      Paint()
        ..color = indicatorColor.withOpacity(0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );
  }

  @override
  bool shouldRepaint(covariant _Light3DPainter oldDelegate) {
    return oldDelegate.image != image ||
        oldDelegate.lightX != lightX ||
        oldDelegate.lightY != lightY ||
        oldDelegate.lightType != lightType ||
        oldDelegate.lightIntensity != lightIntensity ||
        oldDelegate.lightRadius != lightRadius ||
        oldDelegate.darkIntensity != darkIntensity ||
        oldDelegate.showIndicatorLine != showIndicatorLine ||
        oldDelegate.showBorder != showBorder;
  }
}
