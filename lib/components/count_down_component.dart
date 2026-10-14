import 'package:flame/components.dart';
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
      text:
      'Remaining: '
          '$remainingSeconds',
      anchor: Anchor.center,
      position: Vector2(game.size.x / 2, game.size.y / 2),
    );

    game.add(countdownText);
    countdownTimer = TimerComponent(
      period: 1,
      repeat: true,
      onTick: () {
        remainingSeconds--;

        countdownText.text = 'Remaining: $remainingSeconds';
        print('Remaining: $remainingSeconds');
        removeFromParent();
        if (remainingSeconds <= 0) {
          print('Game started!');

          countdownTimer.removeFromParent();
        }
      },
    );

    add(countdownTimer);
  }
}
