import '../workbench/core_service_workbench.dart';
import '../../init/stuff/platform_selector/abstract/ife_platform_selector_service.dart';
mixin CoreMixinPlatformSelectorService {
  final IPlatformSelectorService platformSelectorService =
      CoreServiceWorkBench.platformSelectorService;
}
