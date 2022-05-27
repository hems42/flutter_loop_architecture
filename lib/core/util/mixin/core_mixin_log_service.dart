import '../../init/log/abstract/ife_log_service.dart';
import '../workbench/core_service_workbench.dart';

mixin CoreMixinLogService {
  final ILogService logService = CoreServiceWorkBench.logService;
}
