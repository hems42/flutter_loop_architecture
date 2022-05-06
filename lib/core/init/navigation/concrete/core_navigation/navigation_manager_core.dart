import 'package:flutter/material.dart';
import '../../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../../../view/authentication/_signup/view/concrete/signup_view.dart';
import '../../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../../constant/static/navigation/navigation_statics.dart';
import '../../abstract/ife_navigation_manager.dart';

class NavigationManagerOfCore with INavigationManager {
  static final NavigationManagerOfCore _instance =
      NavigationManagerOfCore._init();
  static NavigationManagerOfCore get instance => _instance;
  NavigationManagerOfCore._init();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Route<dynamic> _generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.ON_BOARD:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);
      case NavigationConstant.SPLASH:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);
      case NavigationConstant.SIGN_UP:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);
      case NavigationConstant.LOGIN:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);
      case NavigationConstant.FORGET_PASSWORD:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);
      case NavigationConstant.NOT_FOUND:
        return _normalNavigate(SignupView(), NavigationConstant.SIGN_UP);

      default:
        return MaterialPageRoute(
          builder: (context) => SignupView(),
        );
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, String pageName,
      {NavigationAnimationsEnum? selectedAnimation}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    await _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        getSelectedPageStringFromNavigationPagesEnum(page),
        removeAllOldRoutes,
        arguments: data);
  }

  Route Function(RouteSettings args) getRouteGenarator() => _generateRoute;

  get navigatorKey => _navigatorKey;

  @override
  getStuffUtilOfNavigationService() {
    return this;
  }

  @override
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    await _navigatorKey.currentState!.pushNamed(
        getSelectedPageStringFromNavigationPagesEnum(page),
        arguments: data);
  }
}
