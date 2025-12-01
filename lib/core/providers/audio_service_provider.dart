import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/services/audio/audio_service.dart';
import 'package:tictactoe/core/services/audio/impl/audioplayers_audio_service.dart';

part 'audio_service_provider.g.dart';

@Riverpod(keepAlive: true)
AudioService audioService(Ref ref) {
  final service = AudioPlayersAudioService();

  service.init();
  ref.onDispose(service.dispose);
  return service;
}
