import '../../../constant/enum/log/log_levels_enum.dart';
import '../../../constant/enum/log/log_manager_types_enum.dart';
import '../../../constant/enum/log/to_log_types_enum.dart';
import 'logger/log_manager_logger.dart';
import '../abstract/ife_log_manager.dart';
import '../abstract/ife_log_service.dart';

class LogService implements ILogService {
  static LogService? _instance;
  late final ILogManager _manager;

  static LogService get instance {
    _instance ??= LogService._init();
    return _instance!;
  }

  LogService._init() {
    _manager = _selectManager(LogManagerTypesEnum.LOGGER)!;
  }

  ILogManager? _selectManager(LogManagerTypesEnum types) {
    switch (types) {
      case LogManagerTypesEnum.LOGGER:
        return LogManagerOfLogger.instance;
      default:
        return LogManagerOfLogger.instance;
    }
  }

  @override
  log(LogLevelEnum logDegree, String logMessage, {ToLogTypesEnum? toLogTypes}) {
    _manager.log(logDegree, logMessage, toLogTypes: toLogTypes);
  }
}
