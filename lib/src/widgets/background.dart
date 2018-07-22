import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class ParallaxBackground extends StatefulWidget {
  final Widget child;
  final bool isDay;

  const ParallaxBackground({
    Key key,
    this.child,
    this.isDay,
  }) : super(key: key);

  @override
  ParallaxBackgroundState createState() {
    // TODO: implement createState
    return ParallaxBackgroundState();
  }
}

class ParallaxBackgroundState extends State<ParallaxBackground>
    with TickerProviderStateMixin {
  AnimationController controller;
  List<BackgroundLayer> backgroundLayers = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
    );

    controller.forward();

    for (int i = 1; i <= 8; i++) {
      backgroundLayers
          .add(BackgroundLayer('assets/background/night/$i.png', 1920, 1080));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BackgroundPainter(
            controller: controller,
            layers: backgroundLayers,
            screenHeight: MediaQuery.of(context).size.height,
          ),
          child: child,
          willChange: true,
        );
      },
      child: widget.child,
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final AnimationController controller;
  final List<BackgroundLayer> layers;
  final screenHeight;

  BackgroundPainter({
    this.controller,
    this.layers,
    this.screenHeight,
  }) : super(repaint: controller) {}

  @override
  void paint(Canvas canvas, Size size) {
    if (layers.length <= 0) return;

    if (controller.isCompleted) {
      controller.reverse();
    } else if (controller.isDismissed) {
      controller.forward();
    }

    var ratio = screenHeight / layers[0].height;
    canvas.scale(ratio, ratio);

    for (int i = 0; i < layers.length; i++) {
      layers[i].draw(canvas, size);
      layers[i].posX = layers[i].posX - 0.2 * i;
    }
  }

  @override
  bool shouldRepaint(BackgroundPainter old) {
    return controller.value != old.controller.value;
  }
}

class BackgroundLayer {
  var pattern;
  Paint paint;
  int width, height;
  double posX = 0.0, posY = 0.0;
  bool isInitialized = false;

  BackgroundLayer(assetPath, this.width, this.height) {
    rootBundle.load(assetPath).then((bd) {
      Uint8List lst = new Uint8List.view(bd.buffer);
      ui.instantiateImageCodec(lst).then((codec) {
        codec.getNextFrame().then((frameInfo) {
          _initialize(frameInfo.image);
        });
      });
    });
  }

  void _initialize(image) {
    var pictureRecorder = ui.PictureRecorder();
    var patternCanvas = Canvas(pictureRecorder);

    // paint pattern on temp canva
    paint = Paint();
    paint.style = PaintingStyle.fill;
    patternCanvas.drawImage(image, Offset.zero, paint);

    ui.Picture p = pictureRecorder.endRecording();
    pattern = p.toImage(width, height);

    // Setup paint for actual drawing
    paint.shader = ImageShader(
        pattern, TileMode.repeated, TileMode.clamp, Matrix4.identity().storage);
    paint.blendMode = BlendMode.srcOver;
    paint.maskFilter = null;

    isInitialized = true;
  }

  void draw(Canvas canvas, Size size) {
    if (!isInitialized) return;
    canvas.save();
    canvas.translate(posX, posY);
    canvas.drawPaint(paint);
    // canvas.drawRect(Offset(-posX, -posY) & size, paint);
    canvas.restore();
  }
}
