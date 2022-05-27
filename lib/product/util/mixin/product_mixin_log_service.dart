import '../../../core/util/workbench/core_service_workbench.dart';
import '../../../core/init/log/abstract/ife_log_service.dart';

mixin ProductMixinLogService {
  final ILogService logService = CoreServiceWorkBench.logService;
}
