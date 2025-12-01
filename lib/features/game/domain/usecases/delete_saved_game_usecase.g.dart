// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_saved_game_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteSavedGameUseCase)
const deleteSavedGameUseCaseProvider = DeleteSavedGameUseCaseProvider._();

final class DeleteSavedGameUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteSavedGameUseCase,
          DeleteSavedGameUseCase,
          DeleteSavedGameUseCase
        >
    with $Provider<DeleteSavedGameUseCase> {
  const DeleteSavedGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteSavedGameUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteSavedGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteSavedGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteSavedGameUseCase create(Ref ref) {
    return deleteSavedGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteSavedGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteSavedGameUseCase>(value),
    );
  }
}

String _$deleteSavedGameUseCaseHash() =>
    r'754f59133db43c2ac2c94408aaf2c2a5dc607368';
