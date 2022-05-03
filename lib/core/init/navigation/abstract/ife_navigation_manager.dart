import '../../../constant/enum/navigation/app_navigation_pages_enum.dart';
import '../../../constant/static/navigation_static.dart';
import 'ife_navigation_service.dart';

mixin INavigationManager implements INavigationService {
  String getSelectedPageStringFromAppNavigationPagesEnum(
      AppNavigationPagesEnum pages) {
    switch (pages) {
      case AppNavigationPagesEnum.TEST_VIEW:
        return NavigationConstant.TEST_VIEW;

      case AppNavigationPagesEnum.DEFAULT:
        return NavigationConstant.DEFAULT;

      default:
        return NavigationConstant.NOT_FOUND;
    }
  }
}
