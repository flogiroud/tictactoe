import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';

part 'current_game_mode_provider.g.dart';

@Riverpod(dependencies: [])
GameMode? currentGameMode(Ref ref) => null;
