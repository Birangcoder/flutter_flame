import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class Wall extends Component {
  final Paint playerPaint = Paint()
    ..color = Colors.blue;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      Rect.fromLTWH(300, 200, 50, 50),
      playerPaint,
    );
  }
}