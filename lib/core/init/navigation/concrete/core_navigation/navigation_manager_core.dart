import 'package:flutter/material.dart';
import 'package:flutter_notebook/view/authentication/_signup/view/concrete/signup_view.dart';
import '../../../../constants/enum/navigation/app_navigation_animations_enum.dart';
import '../../../../constants/enum/navigation/app_navigation_pages_enum.dart';
import '../../../../constants/navigation/navigation_constants.dart';
import '../../abstract/ife_navigation_manager.dart';

class NavigationManagerOfCore with INavigationManager {
  static final NavigationManagerOfCore _instance =
      NavigationManagerOfCore._init();
  static NavigationManagerOfCore get instance => _instance;
  NavigationManagerOfCore._init();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Route<dynamic> _generateRoute(RouteSettings args) {
    switch (args.name) {
      case AppNavigationPageConstants.DEFAULT:
        return _normalNavigate(
             SignupView(), AppNavigationPageConstants.DEFAULT);

      default:
        return MaterialPageRoute(
          builder: (context) =>  SignupView(),
        );
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, String pageName,
      {AppNavigationAnimationsEnum? selectedAnimation}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }

  @override
  Future<void> navigateToPage(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation}) async {
    await _navigatorKey.currentState!.pushNamed(
        getSelectedPageStringFromAppNavigationPagesEnum(page),
        arguments: data);
  }

  @override
  Future<void> navigateToPageClear(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation}) async {
    await _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        getSelectedPageStringFromAppNavigationPagesEnum(page),
        removeAllOldRoutes,
        arguments: data);
  }

  Route Function(RouteSettings args) getRouteGenarator() => _generateRoute;

  GlobalKey<NavigatorState> getNavigatorKey() => _navigatorKey;

  @override
  getStuffUtilOfNavigationService() {
    return this;
  }
}
