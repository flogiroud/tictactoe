import 'package:tictactoe/core/l10n/app_localizations.dart';
import 'package:tictactoe/features/game/domain/entities/ai_difficulty.dart';

extension AiDifficultyExtension on AiDifficulty {
  String displayName(AppLocalizations l10n) => map(
    easy: (_) => l10n.aiDifficultyEasy,
    hard: (_) => l10n.aiDifficultyHard,
  );
}
