// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_saved_game_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasSavedGameUseCase)
const hasSavedGameUseCaseProvider = HasSavedGameUseCaseProvider._();

final class HasSavedGameUseCaseProvider
    extends
        $FunctionalProvider<
          HasSavedGameUseCase,
          HasSavedGameUseCase,
          HasSavedGameUseCase
        >
    with $Provider<HasSavedGameUseCase> {
  const HasSavedGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasSavedGameUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasSavedGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<HasSavedGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HasSavedGameUseCase create(Ref ref) {
    return hasSavedGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HasSavedGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HasSavedGameUseCase>(value),
    );
  }
}

String _$hasSavedGameUseCaseHash() =>
    r'f257d8bb7f20f4adba4c5cf30144d2e7bb03fe8c';
