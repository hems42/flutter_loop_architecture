import '../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../constant/static/navigation/navigation_statics.dart';
import 'ife_navigation_service.dart';

mixin INavigationManager implements INavigationService {
  String getSelectedPageStringFromNavigationPagesEnum(
      NavigationPagesEnum pages) {
    switch (pages) {
      case NavigationPagesEnum.ON_BOARD:
        return NavigationConstant.ON_BOARD;

      case NavigationPagesEnum.SPLASH:
        return NavigationConstant.SPLASH;

      case NavigationPagesEnum.SIGN_UP:
        return NavigationConstant.SIGN_UP;

      case NavigationPagesEnum.LOGIN:
        return NavigationConstant.LOGIN;

      case NavigationPagesEnum.FORGET_PASSWORD:
        return NavigationConstant.FORGET_PASSWORD;

      case NavigationPagesEnum.NOT_FOUND:
        return NavigationConstant.NOT_FOUND;
    }
  }
}
