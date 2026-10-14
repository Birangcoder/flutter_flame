import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

import '../components/count_down_component.dart';
import '../components/sprite_components.dart';

class MyGame extends FlameGame {
  late final CircleComponent player;

  @override
  Color backgroundColor() => const Color(0xFF202124);

  @override
  Future<void> onLoad() async {
    final image = await images.load('player_walk.png');

    // Add a large ground area to the world.
    // world.add(
    //   RectangleComponent(
    //     position: Vector2(-1000, -1000),
    //     size: Vector2(2000, 2000),
    //     paint: Paint()..color = Colors.green,
    //   ),
    // );
    //
    // // Create the player.
    // player = CircleComponent(
    //   position: Vector2(200, 200),
    //   radius: 20,
    //   anchor: Anchor.center,
    //   paint: Paint()..color = Colors.blue,
    // );
    //
    // world.add(player);
    //
    // // Add a landmark.
    // world.add(
    //   RectangleComponent(
    //     position: Vector2(300, 200),
    //     size: Vector2(80, 80),
    //     paint: Paint()..color = Colors.brown,
    //   ),
    // );
    //
    // // Make the camera follow the player.
    // camera.follow(player);

    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2(64, 96),
    );

    final animation = spriteSheet.createAnimation(
      row: 3,
      stepTime: 0.18,
      from: 0,
      to: 4,
    );
    //
    addAll([
      // TextComponent(
      //   text: 'Hello, Flame!',
      //   anchor: Anchor.center,
      //   position: Vector2(size.x / 2, size.y / 2),
      //   textRenderer: TextPaint(
      //     style: const TextStyle(color: Colors.white, fontSize: 32),
      //   ),
      // ),
      // Wall(),
      // GrassComponent(),
      // HouseComponent(),
      PlayerSpriteComponent(game: this),
      EnemySpriteComponent(game: this),
      SpriteAnimationComponent(
        animation: animation,
        position: Vector2(100, 100),
        size: Vector2(128, 192),
      ),
      CountdownComponent(game: this)
    ]);
  }
}
