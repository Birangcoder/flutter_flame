import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class HouseComponent extends PositionComponent {
  HouseComponent()
    : super(position: Vector2(500, 500), size: Vector2(100, 100));

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, 50, 50),
      Paint()..color = Colors.green,
    );
  }
}
