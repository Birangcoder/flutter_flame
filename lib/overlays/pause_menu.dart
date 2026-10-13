import 'package:flutter/material.dart';

import '../game/my_game.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({super.key, required this.game});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Game Paused',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Hide the pause menu.
                  game.overlays.remove('PauseMenu');

                  // Resume game updates.
                  game.resumeEngine();
                },
                child: const Text('Resume'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
