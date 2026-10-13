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
      body: Stack(
        children: [
          // 1. The Flame game occupies the screen.
          Positioned.fill(
            child: GameWidget<MyGame>(
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
          ),

          // 3. Flutter button above the game.
          Positioned(
            top: 40,
            right: 20,
            child: SafeArea(
              child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                icon: const Icon(Icons.pause),
                onPressed: () {
                  // Stop game updates.
                  game.pauseEngine();

                  // Display the pause menu.
                  game.overlays.add('PauseMenu');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
