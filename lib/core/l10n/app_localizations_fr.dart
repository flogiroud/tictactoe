// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get aiDifficultyEasy => 'Facile';

  @override
  String get aiDifficultyHard => 'Difficile';

  @override
  String get cancel => 'Annuler';

  @override
  String get gameDraw => 'Match nul !';

  @override
  String get gameInProgress => 'Partie en cours';

  @override
  String get gameInProgressMessage =>
      'Une partie est déjà en cours. Veuillez terminer ou quitter la partie en cours d\'abord.';

  @override
  String get gameModeAi => 'vs IA';

  @override
  String get gameModeLocal => '1 vs 1';

  @override
  String get gameOver => 'Partie terminée';

  @override
  String get goToHome => 'Retour à l\'accueil';

  @override
  String get menu => 'Menu';

  @override
  String get newGame => 'Nouvelle Partie';

  @override
  String get ok => 'OK';

  @override
  String get pageNotFound => 'Page introuvable';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get playLocal => 'Jouer en Local (1 vs 1)';

  @override
  String get playVsAi => 'Jouer vs IA';

  @override
  String playerTurn(Object player) {
    return 'Joueur $player';
  }

  @override
  String playerWins(Object player) {
    return 'Le joueur $player gagne !';
  }

  @override
  String get resume => 'Reprendre';

  @override
  String get resumeGameMessage =>
      'Vous avez une partie en cours. Souhaitez-vous la reprendre ?';

  @override
  String get resumeGameTitle => 'Reprendre la partie ?';

  @override
  String get selectDifficulty => 'Sélectionner la difficulté';

  @override
  String get solo => 'Solo';

  @override
  String get vs => 'vs';
}
