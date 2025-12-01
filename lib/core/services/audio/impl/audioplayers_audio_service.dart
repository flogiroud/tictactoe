import 'package:audioplayers/audioplayers.dart';
import 'package:tictactoe/core/extensions/string_extension.dart';
import 'package:tictactoe/core/services/audio/audio_service.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/utils/logger.dart';

class AudioPlayersAudioService implements AudioService {
  AudioCache? _cache;
  final Map<String, AudioPool> _pools = {};
  bool _isInitialized = false;

  final _audioContext = AudioContext(
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.ambient,
      options: const {},
    ),
    android: const AudioContextAndroid(
      audioFocus: AndroidAudioFocus.none,
      contentType: AndroidContentType.sonification,
      audioMode: AndroidAudioMode.normal,
      usageType: AndroidUsageType.game,
    ),
  );

  List<AppSound> get _reducedVolumeSounds => [AppSound.click, AppSound.cell];

  @override
  void init() {
    if (_isInitialized) return;

    try {
      _cache = AudioCache(prefix: 'assets/sounds/');
      AudioPlayer.global.setAudioContext(_audioContext);
      _isInitialized = true;
    } catch (e) {
      logger.e('Failed to initialize audio service', error: e);
    }
  }

  @override
  void dispose() {
    try {
      _cache?.clearAll();
      Future.wait(_pools.values.map((pool) => pool.dispose()));
      _pools.clear();
      _isInitialized = false;
    } catch (e) {
      logger.e('Failed to dispose audio service', error: e);
    }
  }

  Future<AudioPool?> _getSoundPool(AppSound sound) async {
    try {
      if (!_isInitialized || _cache == null) return null;

      if (!_pools.containsKey(sound.name)) {
        final pool = await AudioPool.createFromAsset(
          path: '${sound.name.toSnakeCase}.mp3',
          maxPlayers: 3,
          audioCache: _cache!,
        );

        _pools[sound.name] = pool;
      }
      return _pools[sound.name];
    } catch (e) {
      logger.e('Failed to create sound pool for ${sound.name}', error: e);
      return null;
    }
  }

  @override
  Future<void> play(AppSound sound) async {
    if (!_isInitialized) {
      init();
    }

    try {
      final pool = await _getSoundPool(sound);
      final volume = _reducedVolumeSounds.contains(sound) ? 0.25 : 1.0;

      await pool?.start(volume: volume);
    } catch (e) {
      logger.e('Failed to play ${sound.name}', error: e);
    }
  }
}
