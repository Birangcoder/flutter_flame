import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  MyGame() {
    // Set the background color of the game.
    // This is a property of the game, not a Flutter widget.
    camera.backgroundColor = const Color(0xFF202124);
  }

  @override
  Future<void> onLoad() async {
    // Add a text component to the game world.
    add(
      TextComponent(
        text: 'Hello, Flame!',
        position: Vector2(50, 100),
        textRenderer: TextPaint(
          style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
        ),
      ),
    );
  }
}
