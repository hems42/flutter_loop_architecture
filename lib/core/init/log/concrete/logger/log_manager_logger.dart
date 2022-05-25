import '../../../../constant/enum/log/log_levels_enum.dart';
import '../../../../constant/enum/log/to_log_types_enum.dart';
import '../../abstract/ife_log_manager.dart';
import 'package:logger/logger.dart';

class LogManagerOfLogger with ILogManager {
  static LogManagerOfLogger? _instance;
  late final _logger;
  static LogManagerOfLogger get instance {
    _instance ??= LogManagerOfLogger._init();
    return _instance!;
  }

  LogManagerOfLogger._init() {
    _logger = Logger();
  }

  @override
  log(LogLevelEnum logDegree, String logMessage, {ToLogTypesEnum? toLogTypes}) {
    switch (logDegree) {
      case LogLevelEnum.INFO:
        _logger.i(logMessage);
        break;

      case LogLevelEnum.ERROR:
        _logger.e(logMessage);
        break;

      case LogLevelEnum.WARN:
        _logger.w(logMessage);
        break;
      case LogLevelEnum.DEBUG:
        _logger.d(logMessage);
        break;
      case LogLevelEnum.TERRIBLE_FAILURE:
        _logger.wtf(logMessage);
        break;
      case LogLevelEnum.VERBOSE:
        _logger.v(logMessage);
        break;
      default:
    }
  }
}
