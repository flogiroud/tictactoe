import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/app.dart';
import 'package:tictactoe/core/observers/logger_provider_observer.dart';
import 'package:tictactoe/core/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger = LoggerHelper.dev();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const ProviderScope(observers: [LoggerProviderObserver()], child: App()),
  );
}
