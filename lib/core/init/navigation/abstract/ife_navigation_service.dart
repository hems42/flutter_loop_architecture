import '../../../constant/enum/navigation/navigation_action_types_enum.dart';
import '../../../base/model/abstract/ife_base_navigation_request_model.dart';
import '../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../constant/enum/navigation/navigation_pages_enum.dart';

abstract class INavigationService {
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation});
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation});

       Future<T> navigate<T>(NavigationPagesEnum page,
       IBaseNavigationRequestModel<T> navigationRequestModel,
       NavigationActionTypesEnum actionTypesEnum,
      {Object? data, NavigationAnimationsEnum? selectedAnimation});

}
