import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF202124);

  @override
  Future<void> onLoad() async {
    add(
      TextComponent(
        text: 'Hello, Flame!',
        anchor: Anchor.center,
        position: Vector2(size.x / 2, size.y / 2),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
