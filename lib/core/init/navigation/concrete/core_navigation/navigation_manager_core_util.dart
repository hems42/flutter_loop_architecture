import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/constant/static/navigation/navigation_statics.dart';
import 'package:flutter_notebook/view/authentication/_signup/view/concrete/signup_view.dart';

class NavigationManagerOfCoreUtil {
  static final NavigationManagerOfCoreUtil _instance =
      NavigationManagerOfCoreUtil._init();
  static NavigationManagerOfCoreUtil get instance => _instance;

  NavigationManagerOfCoreUtil._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.SIGN_UP:
        return normalNavigate(SignupView(), NavigationConstant.SIGN_UP);

      case NavigationConstant.LOGIN:
        return normalNavigate(getLogin(), NavigationConstant.LOGIN);

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

  Widget getLogin() {
    return Scaffold(
      appBar: AppBar(title: Text("LoginPage"),),
      body: Center(
        child: Container(
          color: Colors.amber,
          child: Text("LOGİN PAGE", style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
