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

    print("seçilen platform : " + currentPlatform.toString());
  }

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SIGN_UP:
        return _normalNavigate(SignupView(), NavigationConstants.SIGN_UP);

      case NavigationConstants.LOGIN:
        return _normalNavigate(NotFoundPageView(), NavigationConstants.LOGIN);

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
    await _navigatorKey.currentState!.pushNamed(
        getSelectedPageStringFromNavigationPagesEnum(page),
        arguments: data);
  }

  PageRoute _normalNavigate(Widget widget, String pageName,
      {NavigationAnimationsEnum? selectedAnimation}) {
    return downSlideAnimation(widget);
    // builder: (context) => widget, settings: RouteSettings(name: pageName));
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
}
