import 'package:flutter/foundation.dart';
import '../../../../../constant/enum/system/platform_types_enum.dart';
import '../../abstract/ife_platform_selector_manager.dart';

class PlatformSelectorManagerOfStock with IPlatformSelectorManager {
  static PlatformSelectorManagerOfStock? _instance;
  static PlatformSelectorManagerOfStock? get instance {
    _instance ??= PlatformSelectorManagerOfStock._init();
    return _instance;
  }

  PlatformSelectorManagerOfStock._init();

  @override
  PlatformTypesEnum? getCurrentPlatform() {
    return _defineCurrentPlatfrom();
  }

  PlatformTypesEnum _defineCurrentPlatfrom() {
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
  }
}
