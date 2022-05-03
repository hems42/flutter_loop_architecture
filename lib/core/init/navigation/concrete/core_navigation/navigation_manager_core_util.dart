import 'package:flutter/material.dart';

class NavigationManagerOfCoreUtil {
    static final NavigationManagerOfCoreUtil _instance = NavigationManagerOfCoreUtil._init();
  static NavigationManagerOfCoreUtil get instance => _instance;

  NavigationManagerOfCoreUtil._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case "":
        return normalNavigate(Container(), "");

 

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }

  NotFoundNavigationWidget() {}
}