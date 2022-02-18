import 'package:flutter_notebook/core/init/navigation/concrete/core_navigation/ife_navigation_manager_core.dart';

class NavigationManagerOfCore implements INavigationManagerOfCore {
  static final NavigationManagerOfCore _instance = NavigationManagerOfCore._init();
  static NavigationManagerOfCore get instance => _instance;
  NavigationManagerOfCore._init();
}
