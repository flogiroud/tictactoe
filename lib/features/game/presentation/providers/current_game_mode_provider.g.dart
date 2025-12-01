// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_game_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentGameMode)
const currentGameModeProvider = CurrentGameModeProvider._();

final class CurrentGameModeProvider
    extends $FunctionalProvider<GameMode?, GameMode?, GameMode?>
    with $Provider<GameMode?> {
  const CurrentGameModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentGameModeProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$currentGameModeHash();

  @$internal
  @override
  $ProviderElement<GameMode?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameMode? create(Ref ref) {
    return currentGameMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameMode? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameMode?>(value),
    );
  }
}

String _$currentGameModeHash() => r'887cadf2454553baa3d4eb7763db3626a2ca7ce5';
