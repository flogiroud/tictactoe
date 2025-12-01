// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_game_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localGameDataSource)
const localGameDataSourceProvider = LocalGameDataSourceProvider._();

final class LocalGameDataSourceProvider
    extends
        $FunctionalProvider<
          LocalGameDataSource,
          LocalGameDataSource,
          LocalGameDataSource
        >
    with $Provider<LocalGameDataSource> {
  const LocalGameDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localGameDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localGameDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocalGameDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalGameDataSource create(Ref ref) {
    return localGameDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalGameDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalGameDataSource>(value),
    );
  }
}

String _$localGameDataSourceHash() =>
    r'83d28140d3e3cdc7f1521883b7f5b992d42327a3';
