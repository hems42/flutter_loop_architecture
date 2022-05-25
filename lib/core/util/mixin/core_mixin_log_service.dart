import '../../init/log/abstract/ife_log_service.dart';
import '../../init/log/concrete/log_service.dart';

mixin CoreMixinLogService {
  final ILogService logService = LogService.instance;
}
