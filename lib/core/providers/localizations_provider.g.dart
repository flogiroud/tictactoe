// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localizations)
const localizationsProvider = LocalizationsProvider._();

final class LocalizationsProvider
    extends
        $FunctionalProvider<
          AppLocalizations,
          AppLocalizations,
          AppLocalizations
        >
    with $Provider<AppLocalizations> {
  const LocalizationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localizationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localizationsHash();

  @$internal
  @override
  $ProviderElement<AppLocalizations> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLocalizations create(Ref ref) {
    return localizations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocalizations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocalizations>(value),
    );
  }
}

String _$localizationsHash() => r'953dc89d6925d1911bba419c26573686fb3afbc2';
