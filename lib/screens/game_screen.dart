import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/my_game.dart';
import '../overlays/pause_menu.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final MyGame game;

  @override
  void initState() {
    super.initState();
    game = MyGame();
  }

  @override
  void dispose() {
    game.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<MyGame>(
        game: game,

        // 2. Register the pause menu.
        overlayBuilderMap: {
          'PauseMenu': (context, game) {
            return PauseMenu(game: game);
          },
        },

        // Do not show the menu when the game starts.
        initialActiveOverlays: const [],
      ),
    );
  }
}
