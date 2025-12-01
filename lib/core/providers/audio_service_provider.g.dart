// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioService)
const audioServiceProvider = AudioServiceProvider._();

final class AudioServiceProvider
    extends $FunctionalProvider<AudioService, AudioService, AudioService>
    with $Provider<AudioService> {
  const AudioServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioServiceHash();

  @$internal
  @override
  $ProviderElement<AudioService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AudioService create(Ref ref) {
    return audioService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioService>(value),
    );
  }
}

String _$audioServiceHash() => r'b5fef15c7d3dd3b37204fa525e9d94a0707fe4eb';
