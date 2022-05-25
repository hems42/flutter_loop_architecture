import 'package:flutter/foundation.dart';
import 'package:flutter_notebook/core/init/stuff/platform_selector/concrete/platform_selector_service.dart';
import 'package:flutter_notebook/core/util/workbench/core_manager_workbench.dart';
import '../../../constant/enum/system/platform_types_enum.dart';
import '../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../constant/enum/navigation/navigation_pages_enum.dart';
import '../../../constant/static/navigation/navigation_statics.dart';
import 'ife_navigation_service.dart';

mixin INavigationManager implements INavigationService {

  NavigationAnimationsEnum? _selectedAnimation;
  get selectedAnimation => _selectedAnimation;

  void updateSelectedAnimation(NavigationAnimationsEnum? selectedAnimation) {
    _selectedAnimation = null;
    _selectedAnimation = selectedAnimation;
  }

  String getSelectedPageStringFromNavigationPagesEnum(
      NavigationPagesEnum pages) {
    switch (pages) {
      case NavigationPagesEnum.ON_BOARD:
        return NavigationConstants.ON_BOARD;

      case NavigationPagesEnum.SPLASH:
        return NavigationConstants.SPLASH;

      case NavigationPagesEnum.SIGN_UP:
        return NavigationConstants.SIGN_UP;

      case NavigationPagesEnum.LOGIN:
        return NavigationConstants.LOGIN;

      case NavigationPagesEnum.FORGET_PASSWORD:
        return NavigationConstants.FORGET_PASSWORD;

      case NavigationPagesEnum.NOT_FOUND:
        return NavigationConstants.NOT_FOUND;
    }
  }

  PlatformTypesEnum? currentPlatform;

 /*  PlatformTypesEnum defineCurrentPlatfrom() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return PlatformTypesEnum.ANDROID;

      case TargetPlatform.iOS:
        return PlatformTypesEnum.IOS;

      case TargetPlatform.windows:
        return PlatformTypesEnum.WINDOWS;

      case TargetPlatform.linux:
        return PlatformTypesEnum.LINUX;

      case TargetPlatform.fuchsia:
        return PlatformTypesEnum.FUCHSIA;

      case TargetPlatform.macOS:
        return PlatformTypesEnum.MACOS;

      default:
        return PlatformTypesEnum.WEB;
    }
  } */
}
