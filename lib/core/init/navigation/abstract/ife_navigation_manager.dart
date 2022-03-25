import '../../../constants/navigation/navigation_constants.dart';
import 'ife_navigation_service.dart';
import '../../../constants/enum/navigation/app_navigation_pages_enum.dart';

mixin INavigationManager implements INavigationService {
  String getSelectedPageStringFromAppNavigationPagesEnum(
      AppNavigationPagesEnum pages) {
    switch (pages) {
      case AppNavigationPagesEnum.TEST_VIEW:
        return AppNavigationPageConstants.TEST_VIEW;

      case AppNavigationPagesEnum.DEFAULT:
        return AppNavigationPageConstants.DEFAULT;

      default:
        return AppNavigationPageConstants.NOT_FOUND;
    }
  }
}
