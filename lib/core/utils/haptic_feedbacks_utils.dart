import 'dart:convert';

import 'package:gaimon/gaimon.dart';
import 'package:tictactoe/core/utils/logger.dart';

class HapticFeedbackUtils {
  static void selection() {
    try {
      return Gaimon.selection();
    } catch (error, trace) {
      logger.e(
        'Failed to play selection haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static void soft() {
    try {
      return Gaimon.soft();
    } catch (error, trace) {
      logger.e(
        'Failed to play soft haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static void light() {
    try {
      return Gaimon.light();
    } catch (error, trace) {
      logger.e(
        'Failed to play light haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static void medium() {
    try {
      return Gaimon.medium();
    } catch (error, trace) {
      logger.e(
        'Failed to play medium haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static void heavy() {
    try {
      return Gaimon.heavy();
    } catch (error, trace) {
      logger.e(
        'Failed to play heavy haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static void success() {
    try {
      return Gaimon.success();
    } catch (error, trace) {
      logger.e(
        'Failed to play success haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }

  static Future<void> gameOver() async {
    try {
      final haptic = {
        'Version': 1,
        'Pattern': [
          {
            'Event': {
              'Time': 0,
              'EventType': 'HapticContinuous',
              'EventDuration': 0.07,
              'EventParameters': [
                {'ParameterID': 'HapticIntensity', 'ParameterValue': 1},
                {'ParameterID': 'HapticSharpness', 'ParameterValue': 0},
              ],
            },
          },
        ],
      };

      return Gaimon.patternFromData(json.encode(haptic));
    } catch (error, trace) {
      logger.e(
        'Failed to play enter app haptic feedback',
        error: error,
        stackTrace: trace,
      );
    }
  }
}
