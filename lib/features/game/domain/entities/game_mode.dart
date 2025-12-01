import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/utils/logger.dart';
import 'package:tictactoe/features/game/domain/entities/ai_difficulty.dart';

part 'game_mode.freezed.dart';
part 'game_mode.g.dart';

@freezed
sealed class GameMode with _$GameMode {
  const factory GameMode.local() = _Local;
  const factory GameMode.ai({
    @Default(AiDifficulty.hard()) AiDifficulty difficulty,
  }) = _Ai;

  const GameMode._();

  factory GameMode.fromJson(Map<String, dynamic> json) =>
      _$GameModeFromJson(json);

  String toPath() {
    return map(
      local: (_) => 'local',
      ai: (aiMode) => aiMode.difficulty == const AiDifficulty.easy()
          ? 'ai/easy'
          : 'ai/hard',
    );
  }

  bool get isAi => this is _Ai;

  static GameMode fromPath(String path) {
    try {
      final parts = path.toLowerCase().split('/');
      if (parts.isEmpty) return const GameMode.local();

      final mode = parts[0];
      if (mode == 'local') {
        return const GameMode.local();
      } else if (mode == 'ai') {
        final difficulty = parts.length > 1 && parts[1] == 'easy'
            ? const AiDifficulty.easy()
            : const AiDifficulty.hard();
        return GameMode.ai(difficulty: difficulty);
      }

      return const GameMode.local();
    } catch (e) {
      logger.e('Error parsing game mode from path: $e');
      return const GameMode.local();
    }
  }
}
