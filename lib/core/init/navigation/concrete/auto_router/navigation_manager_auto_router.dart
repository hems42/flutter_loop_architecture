import '../../../../constant/enum/navigation/navigation_action_types_enum.dart';
import "../../../../base/model/abstract/ife_base_navigation_request_model.dart";
import '../../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../abstract/ife_navigation_manager.dart';

class NavigationManagerOfAutoRouter with INavigationManager {
  @override
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
    throw UnimplementedError();
  }

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
    
    throw UnimplementedError();
  }

  @override
  Future<T> navigate<T>(
      NavigationPagesEnum page,
      IBaseNavigationRequestModel<T> navigationRequestModel,
      NavigationActionTypesEnum actionTypesEnum,
      {Object? data,
      NavigationAnimationsEnum? selectedAnimation}) {
    throw UnimplementedError();
  }
}
