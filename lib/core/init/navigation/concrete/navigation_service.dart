import '../../../constants/enum/navigation/app_navigation_animations_enum.dart';
import '../../../constants/enum/navigation/app_navigation_pages_enum.dart';
import '../../../constants/enum/navigation/navigation_manager_types_enum.dart';
import '../abstract/ife_navigation_service.dart';
import 'core_navigation/navigation_manager_core.dart';
import '../abstract/ife_navigation_manager.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  late final INavigationManager _manager;
  static NavigationService get instance => _instance;
  NavigationService._init() {
    _manager = _selectService(NavigationManagerTypes.CORE_NAVIGATION);
  }

  INavigationManager _selectService(NavigationManagerTypes types) {
    switch (types) {
      case NavigationManagerTypes.CORE_NAVIGATION:
        return NavigationManagerOfCore.instance;
      default:
        return NavigationManagerOfCore.instance;
    }
  }

  @override
  getStuffUtilOfNavigationService() {
    return _manager.getStuffUtilOfNavigationService();
  }

  @override
  Future<void> navigateToPage(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }

  @override
  Future<void> navigateToPageClear(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }
}
