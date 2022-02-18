import 'package:flutter_notebook/core/constants/enum/navigation_manager_types_enum.dart';
import 'package:flutter_notebook/core/init/navigation/concrete/core_navigation/navigation_manager_core.dart';

import '../abstract/ife_navigation_manager.dart';

class NavigationService implements INavigationManager {
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
}
