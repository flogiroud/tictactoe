// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_game_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(saveGameUseCase)
const saveGameUseCaseProvider = SaveGameUseCaseProvider._();

final class SaveGameUseCaseProvider
    extends
        $FunctionalProvider<SaveGameUseCase, SaveGameUseCase, SaveGameUseCase>
    with $Provider<SaveGameUseCase> {
  const SaveGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveGameUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveGameUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveGameUseCase create(Ref ref) {
    return saveGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveGameUseCase>(value),
    );
  }
}

String _$saveGameUseCaseHash() => r'c771d8ec36fce9307fed93eb55e584528678cf23';
