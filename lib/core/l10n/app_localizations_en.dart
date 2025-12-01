// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aiDifficultyEasy => 'Easy';

  @override
  String get aiDifficultyHard => 'Hard';

  @override
  String get cancel => 'Cancel';

  @override
  String get gameDraw => 'It\'s a draw!';

  @override
  String get gameInProgress => 'Game in Progress';

  @override
  String get gameInProgressMessage =>
      'A game is already in progress. Please finish or quit the current game first.';

  @override
  String get gameModeAi => 'vs AI';

  @override
  String get gameModeLocal => '1 vs 1';

  @override
  String get gameOver => 'Game Over';

  @override
  String get goToHome => 'Go to home';

  @override
  String get menu => 'Menu';

  @override
  String get newGame => 'New Game';

  @override
  String get ok => 'OK';

  @override
  String get pageNotFound => 'Page not found';

  @override
  String get playAgain => 'Play Again';

  @override
  String get playLocal => 'Play Local (1 vs 1)';

  @override
  String get playVsAi => 'Play vs AI';

  @override
  String playerTurn(Object player) {
    return 'Player $player';
  }

  @override
  String playerWins(Object player) {
    return 'Player $player wins!';
  }

  @override
  String get resume => 'Resume';

  @override
  String get resumeGameMessage =>
      'You have a game in progress. Would you like to resume it?';

  @override
  String get resumeGameTitle => 'Resume Game?';

  @override
  String get selectDifficulty => 'Select Difficulty';

  @override
  String get solo => 'Solo';

  @override
  String get vs => 'vs';
}
