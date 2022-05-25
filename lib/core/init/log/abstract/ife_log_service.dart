import 'package:flutter_notebook/core/constant/enum/log/to_log_types_enum.dart';

import '../../../constant/enum/log/log_levels_enum.dart';

abstract class ILogService {
  log(LogLevelEnum logLevel, String logMessage, {ToLogTypesEnum? toLogTypes});

  // be_sure initialize

  // log open

  // log close

  // add log

  // select log type

  // get log

  // log ....

}
