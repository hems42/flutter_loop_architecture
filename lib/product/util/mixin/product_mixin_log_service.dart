import '../../../core/init/log/abstract/ife_log_service.dart';
import '../../../core/init/log/concrete/log_service.dart';

mixin ProductMixinLogService {
  final ILogService logService = LogService.instance;
}
