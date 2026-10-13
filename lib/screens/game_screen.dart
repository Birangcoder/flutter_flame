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
  // Create one game instance for this screen.
  late final MyGame game;

  @override
  void initState() {
    super.initState();
    game = MyGame();
  }

  @override
  void dispose() {
    // Release the game when the screen is removed.
    game.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<MyGame>(
        game: game,

        // Show a loading indicator while the game loads.
        loadingBuilder: (context) {
          return const Center(child: CircularProgressIndicator());
        },

        // Display a simple error screen if loading fails.
        errorBuilder: (context, error) {
          return Center(child: Text('Failed to load game: $error'));
        },

        // Flutter widgets that can appear over the game.
        overlayBuilderMap: {
          'PauseMenu': (context, game) {
            return PauseMenu(game: game);
          },
        },

        // No overlay is displayed initially.
        initialActiveOverlays: const [],
      ),
    );
  }
}
