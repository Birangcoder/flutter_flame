import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: FlameGame(),
      loadingBuilder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error){
        return Center(
          child: Text('Error: $error'),
        );
      },

    ),
  );
}