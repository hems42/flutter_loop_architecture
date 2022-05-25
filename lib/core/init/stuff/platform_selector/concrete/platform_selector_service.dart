import '../../../../constant/enum/system/platform_types_enum.dart';
import '../../../../constant/enum/system/platform_selector_manager_types_enum.dart';
import '../abstract/ife_platform_selector_manager.dart';
import '../abstract/ife_platform_selector_service.dart';
import 'stock_platform_selector/platform_selector_manager_stock.dart';

class PlatformSelectorService implements IPlatformSelectorService {
  static final PlatformSelectorService _instance =
      PlatformSelectorService._init();
  late final IPlatformSelectorManager _manager;
  static PlatformSelectorService get instance => _instance;
  PlatformSelectorService._init() {
    _manager = _selectManager(
        PlatformSelectorManagerTypesEnum.STOCK_PLATFORM_SELECTOR)!;
  }

  IPlatformSelectorManager? _selectManager(
      PlatformSelectorManagerTypesEnum types) {
    switch (types) {
      case PlatformSelectorManagerTypesEnum.STOCK_PLATFORM_SELECTOR:
        return PlatformSelectorManagerOfStock.instance;

      default:
        return PlatformSelectorManagerOfStock.instance;
    }
  }

  @override
  PlatformTypesEnum? getCurrentPlatform() {
    return _manager.getCurrentPlatform();
  }
}
