import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_difficulty.freezed.dart';
part 'ai_difficulty.g.dart';

@freezed
sealed class AiDifficulty with _$AiDifficulty {
  const factory AiDifficulty.easy() = _Easy;
  const factory AiDifficulty.hard() = _Hard;

  const AiDifficulty._();

  factory AiDifficulty.fromJson(Map<String, dynamic> json) =>
      _$AiDifficultyFromJson(json);
}
