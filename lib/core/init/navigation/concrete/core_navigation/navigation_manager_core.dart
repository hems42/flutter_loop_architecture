import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constant/enum/system/platform_types_enum.dart';
import '../../../../../view/util/view/not_found_page.dart';
import '../../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../../../view/authentication/_signup/view/concrete/signup_view.dart';
import '../../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../../constant/static/navigation/navigation_statics.dart';
import '../../abstract/ife_navigation_manager.dart';

part 'navigation_manager_core_animations.dart';

class NavigationManagerOfCore with INavigationManager {
  static final NavigationManagerOfCore _instance =
      NavigationManagerOfCore._init();
  static NavigationManagerOfCore get instance => _instance;
  NavigationManagerOfCore._init() {
    currentPlatform = defineCurrentPlatfrom();
    if (currentPlatform == null) {
      currentPlatform = PlatformTypesEnum.UNDEFINED;
    }
  }

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.SIGN_UP:
        return _navigate(SignupView(), NavigationConstants.SIGN_UP,
            data: settings.arguments, selectedAnimation: selectedAnimation);

      case NavigationConstants.LOGIN:
        return _navigate(NotFoundPageView(), NavigationConstants.LOGIN,
            data: settings.arguments, selectedAnimation: selectedAnimation);

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundPageView(),
        );
    }
  }

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    await _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        getSelectedPageStringFromNavigationPagesEnum(page), removeAllOldRoutes,
        arguments: data);
  }

  get navigatorKey => _navigatorKey;

  @override
  getStuffUtilOfNavigationService() {
    return this;
  }

  @override
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    
    updateSelectedAnimation(selectedAnimation);

    await _navigatorKey.currentState!.pushNamed(
        getSelectedPageStringFromNavigationPagesEnum(page),
        arguments: data);
  }

  PageRoute _navigate(Widget widget, String pageName,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
    if (selectedAnimation == null) {
      switch (currentPlatform) {
        case PlatformTypesEnum.ANDROID:
          return MaterialPageRoute(
              settings: RouteSettings(arguments: data, name: pageName),
              builder: (context) => widget);

        case PlatformTypesEnum.IOS:
          return CupertinoPageRoute(
              settings: RouteSettings(arguments: data, name: pageName),
              builder: (context) => widget);

        default:
          return createPageRoute(
            widget,
            settings: RouteSettings(name: pageName, arguments: data),
            transitionBuilder:
                (context, animation, secondaryAnimation, child) =>
                    getSelectedAnimation(NavigationAnimationsEnum.FADE, context, animation,
                            secondaryAnimation, child)
                        .call(context, animation, secondaryAnimation, child),
          );
      }
      
    } else {
      return createPageRoute(
        widget,
        settings: RouteSettings(name: pageName, arguments: data),
        transitionBuilder: (context, animation, secondaryAnimation, child) =>
            getSelectedAnimation(selectedAnimation, context, animation,
                    secondaryAnimation, child)
                .call(context, animation, secondaryAnimation, child),
      );
    }
  }
}

Widget getLogin() {
  return Scaffold(
    appBar: AppBar(
      title: Text("LoginPage"),
    ),
    body: Center(
      child: Container(
        color: Colors.amber,
        child: Text(
          "LOGİN PAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
