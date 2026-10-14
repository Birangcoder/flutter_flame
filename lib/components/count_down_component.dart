import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter_flame/game/my_game.dart';

class CountdownComponent extends Component {
  final MyGame game;
  int remainingSeconds = 5;

  late final TimerComponent countdownTimer;
  late final TextComponent countdownText;

  CountdownComponent({required this.game});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    countdownText = TextComponent(
      text: 'Remaining: $remainingSeconds',
      anchor: Anchor.center,
      position: Vector2(game.size.x / 2, game.size.y / 2),
    );

    game.add(countdownText);
    countdownText.opacity = 0;
    countdownTimer = TimerComponent(
      period: 1,
      repeat: true,
      onTick: () {
        remainingSeconds--;

        countdownText.text = 'Remaining: $remainingSeconds';
        countdownText.addAll([
          // MoveEffect.by(Vector2(0, -70), EffectController(duration: 1)),
          // RotateEffect.by(pi*2, EffectController(duration: 1)),
          // ScaleEffect.by(Vector2.all(1.2), EffectController(duration: 1)),
          OpacityEffect.to(1, EffectController(duration: 1)),
        ]);
        print('Remaining: $remainingSeconds');
        // removeFromParent();
        if (remainingSeconds <= 0) {
          countdownText.text = 'Game Started!';
          print('Game started!');

          countdownTimer.removeFromParent();
        }
      },
    );

    add(countdownTimer);
  }
}
