import '../../init/stuff/platform_selector/abstract/ife_platform_selector_service.dart';
import '../../init/stuff/platform_selector/concrete/platform_selector_service.dart';

mixin CoreMixinPlatformSelectorService {
  final IPlatformSelectorService platformSelectorService = PlatformSelectorService.instance;
}
