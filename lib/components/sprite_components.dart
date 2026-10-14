import 'package:flame/components.dart';

import '../game/my_game.dart';

class PlayerSpriteComponent extends SpriteComponent {
  final MyGame game;
  PlayerSpriteComponent({required this.game});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load the image from the assets folder.
    final playerImage = await game.images.load('player.png');

    // Create a Sprite from the loaded image.
    final playerSprite = Sprite(playerImage);

    // Assign the sprite to this component.
    sprite = playerSprite;

    // Set the displayed size of the player.
    size = Vector2(100, 100);

    position = Vector2(300, 300);
  }
}

class EnemySpriteComponent extends SpriteComponent {
  final MyGame game;
  EnemySpriteComponent({required this.game});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load the image from the assets folder.
    final enemyImage = await game.images.load('enemy.png');

    // Create a Sprite from the loaded image.
    final enemySprite = Sprite(enemyImage);

    // Assign the sprite to this component.
    sprite = enemySprite;

    // Set the displayed size of the player.
    size = Vector2(100, 100);

    position = Vector2(400, 400);
  }
}
