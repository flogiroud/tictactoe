import 'package:tictactoe/core/services/audio/enums/app_sound.dart';

abstract interface class AudioService {
  void init();

  Future<void> play(AppSound sound);

  void dispose();
}
