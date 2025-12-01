// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameNotifier)
const gameProvider = GameNotifierProvider._();

final class GameNotifierProvider
    extends $NotifierProvider<GameNotifier, GameState> {
  const GameNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[currentGameModeProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          GameNotifierProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = currentGameModeProvider;

  @override
  String debugGetCreateSourceHash() => _$gameNotifierHash();

  @$internal
  @override
  GameNotifier create() => GameNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameState>(value),
    );
  }
}

String _$gameNotifierHash() => r'3f5450f4299b70b46bd87eef9edade9712d1da22';

abstract class _$GameNotifier extends $Notifier<GameState> {
  GameState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GameState, GameState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameState, GameState>,
              GameState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
