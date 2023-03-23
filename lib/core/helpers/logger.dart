import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

enum Level { info, success, warning, error, debug }

/// Logging message to console as [developer].
///
/// See available colors on https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
class Logger {
  Logger._();

  /// Log level [Level.info]
  @Deprecated('Use Logger.i()')
  static void logInfo(String tag, Object? object) {
    log(tag, object, level: Level.info);
  }

  /// Log level [Level.info]
  static void i(String tag, Object? object) {
    print(tag, object, level: Level.info);
  }

  /// Log level [Level.success]
  @Deprecated('Use Logger.clap()')
  static void logSuccess(String tag, Object? object) {
    log(tag, object, level: Level.success);
  }

  /// Log level [Level.success]
  static void clap(String tag, Object? object) {
    print(tag, object, level: Level.success);
  }

  /// Log level [Level.warning]
  @Deprecated('Use Logger.w()')
  static void logWarning(String tag, Object? object) {
    log(tag, object, level: Level.warning);
  }

  /// Log level [Level.warning]
  static void w(String tag, Object? object) {
    print(tag, object, level: Level.warning);
  }

  /// Log level [Level.error]
  @Deprecated('Use Logger.e()')
  static void logError(String tag, Object? object) {
    log(tag, object, level: Level.error);
  }

  /// Log level [Level.error]
  static void e(String tag, Object? object) {
    print(tag, object, level: Level.error);
  }

  /// Log level [Level.debug]
  @Deprecated('Use Logger.d()')
  static void debug(String tag, Object? object) {
    log(tag, object, level: Level.debug);
  }

  static void d(String tag, Object? object) {
    print(tag, object, level: Level.debug);
  }

  /// Print logging message if in debug or profile mode
  @Deprecated('Use print')
  static void log(String tag, Object? object, {Level level = Level.info}) {
    if (!kReleaseMode) {
      String color = '\u001b[37;1m';
      switch (level) {
        case Level.info:
          color = '\x1B[34m';
          break;
        case Level.success:
          color = '\x1B[32m';
          break;
        case Level.warning:
          color = '\x1B[33m';
          break;
        case Level.error:
          color = '\x1B[31m';
          break;
        case Level.debug:
          color = '\x1B[37m';
          break;
      }

      final headerLength = tag.length + 20;
      String line = '';
      for (var i = 0; i < headerLength; i++) {
        line += '=';
      }

      developer.log('$color$line\x1B[0m');
      developer.log('$color\t\t$tag\x1B[0m');
      developer.log('$color$line\x1B[0m');
      developer.log('$color$object\x1B[0m');
      developer.log('$color \x1B[0m');
    }
  }

  static void print(String tag, Object? object, {Level level = Level.info}) {
    if (!kReleaseMode) {
      String color = '\u001b[37;1m';
      switch (level) {
        case Level.info:
          color = '\x1B[34m';
          break;
        case Level.success:
          color = '\x1B[32m';
          break;
        case Level.warning:
          color = '\x1B[33m';
          break;
        case Level.error:
          color = '\x1B[31m';
          break;
        case Level.debug:
          color = '\x1B[37m';
          break;
      }

      developer.log('$color[$tag]: $object\x1B[0m');
    }
  }
}
