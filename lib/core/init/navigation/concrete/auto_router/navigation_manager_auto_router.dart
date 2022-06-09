import 'package:flutter_notebook/core/constant/enum/navigation/navigation_pages_enum.dart';
import 'package:flutter_notebook/core/constant/enum/navigation/navigation_animations_enum.dart';
import 'package:flutter_notebook/core/init/navigation/abstract/ife_navigation_manager.dart';

class NavigationManagerOfAutoRouter with INavigationManager{
  @override
  Future<void> navigateToPage(NavigationPagesEnum page, {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
    // TODO: implement navigateToPage
    throw UnimplementedError();
  }

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page, {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
    // TODO: implement navigateToPageClear
    throw UnimplementedError();
  }

}

