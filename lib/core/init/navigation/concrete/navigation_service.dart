import '../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../constant/enum/navigation/navigation_manager_types_enum.dart';
import '../abstract/ife_navigation_service.dart';
import 'core_navigation/navigation_manager_core.dart';
import '../abstract/ife_navigation_manager.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  late final INavigationManager _manager;
  static NavigationService get instance => _instance;
  NavigationService._init() {
    _manager = _selectManager(NavigationManagerTypesEnum.CORE_NAVIGATION);
  }

  INavigationManager _selectManager(NavigationManagerTypesEnum types) {
    switch (types) {
      case NavigationManagerTypesEnum.CORE_NAVIGATION:
        return NavigationManagerOfCore.instance;
      default:
        return NavigationManagerOfCore.instance;
    }
  }

  @override
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }
}
