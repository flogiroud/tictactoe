// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageService)
const storageServiceProvider = StorageServiceProvider._();

final class StorageServiceProvider
    extends $FunctionalProvider<StorageService, StorageService, StorageService>
    with $Provider<StorageService> {
  const StorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageServiceHash();

  @$internal
  @override
  $ProviderElement<StorageService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageService create(Ref ref) {
    return storageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageService>(value),
    );
  }
}

String _$storageServiceHash() => r'20c1d2a9b17be86a847970ddafb00ad480db295b';
