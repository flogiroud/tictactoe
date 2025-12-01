import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/utils/logger.dart';

final class LoggerProviderObserver extends ProviderObserver {
  const LoggerProviderObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (kDebugMode) {
      logger.d('➕ [${_providerName(context)}] | Value: $value');
    }
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (kDebugMode) {
      logger.d(
        '🔄 [${_providerName(context)}] | Previous: $previousValue | New: $newValue',
      );
    }
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    if (kDebugMode) {
      debugPrint('➖ [${_providerName(context)}]');
    }
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      logger.e(
        '❌ [${_providerName(context)}] | Error: $error\nStackTrace: $stackTrace',
      );
    }
  }

  String _providerName(ProviderObserverContext context) =>
      context.provider.name ?? context.provider.runtimeType.toString();
}
