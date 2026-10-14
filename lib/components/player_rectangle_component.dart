import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GrassComponent extends RectangleComponent {
  GrassComponent()
    : super(
        position: Vector2(100, 100),
        size: Vector2(120, 80),
        paint: Paint()..color = Colors.red,
      );
}
