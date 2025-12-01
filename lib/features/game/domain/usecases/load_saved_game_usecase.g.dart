// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_saved_game_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loadSavedGameUseCase)
const loadSavedGameUseCaseProvider = LoadSavedGameUseCaseProvider._();

final class LoadSavedGameUseCaseProvider
    extends
        $FunctionalProvider<
          LoadSavedGameUseCase,
          LoadSavedGameUseCase,
          LoadSavedGameUseCase
        >
    with $Provider<LoadSavedGameUseCase> {
  const LoadSavedGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadSavedGameUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadSavedGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoadSavedGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoadSavedGameUseCase create(Ref ref) {
    return loadSavedGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadSavedGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadSavedGameUseCase>(value),
    );
  }
}

String _$loadSavedGameUseCaseHash() =>
    r'207d04f90f2c77e816f40732571e18aca6fccdd1';
