import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

late Logger logger;

class LoggerHelper {
  static Logger dev() {
    return Logger(printer: AppPrinter(monitorErrors: !kDebugMode));
  }
}

class AppPrinter extends PrettyPrinter {
  final bool monitorErrors;

  AppPrinter({required this.monitorErrors})
    : super(
        methodCount: 0,
        errorMethodCount: 10,
        lineLength: stdout.hasTerminal ? stdout.terminalColumns : 120,
        colors: true,
        printEmojis: true,
        excludeBox: {Level.trace: true, Level.debug: true},
      );

  @override
  List<String> log(LogEvent event) {
    // NOTE: Can log here to Crashlytics or Sentry
    if (!kDebugMode) return [];
    return super.log(event);
  }
}
