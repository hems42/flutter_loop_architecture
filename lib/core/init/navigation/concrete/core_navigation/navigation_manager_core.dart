import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/constants/navigation/navigation_constants.dart';

import '../../../../constants/enum/app_navigation_pages_enum.dart';
import '../../abstract/ife_navigation_manager.dart';

class NavigationManagerOfCore with INavigationManager {
  static final NavigationManagerOfCore _instance = NavigationManagerOfCore._init();
  static NavigationManagerOfCore get instance => _instance;
  NavigationManagerOfCore._init();

   GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(AppNavigationPagesEnum page, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(getSelectedPageStringFromAppNavigationPagesEnum(page), arguments: data);
  }

  @override
  Future<void> navigateToPageClear(AppNavigationPagesEnum page, {Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(getSelectedPageStringFromAppNavigationPagesEnum(page), removeAllOldRoutes, arguments: data);
  }


}
