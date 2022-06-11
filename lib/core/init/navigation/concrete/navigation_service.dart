import '../../../constant/enum/navigation/navigation_action_types_enum.dart';
import '../../../base/model/abstract/ife_base_navigation_request_model.dart';
import 'stock_navigation/navigation_manager_stock.dart';
import '../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../constant/enum/navigation/navigation_manager_types_enum.dart';
import '../abstract/ife_navigation_service.dart';
import '../abstract/ife_navigation_manager.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  late final INavigationManager _manager;
  static NavigationService get instance => _instance;
  NavigationService._init() {
    _manager = _selectManager(NavigationManagerTypesEnum.STOCK_NAVIGATION);
  }

  INavigationManager _selectManager(NavigationManagerTypesEnum types) {
    switch (types) {
      case NavigationManagerTypesEnum.STOCK_NAVIGATION:
        return NavigationManagerOfStock.instance;
      default:
        return NavigationManagerOfStock.instance;
    }
  }

  @override
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }

  @override
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation}) async {
    _manager.navigateToPage(page,
        data: data, selectedAnimation: selectedAnimation);
  }

  @override
  Future<T> navigate<T>(NavigationPagesEnum page, IBaseNavigationRequestModel<T> navigationRequestModel, NavigationActionTypesEnum actionTypesEnum, {Object? data, NavigationAnimationsEnum? selectedAnimation}) {
   
    throw UnimplementedError();
  }
}
