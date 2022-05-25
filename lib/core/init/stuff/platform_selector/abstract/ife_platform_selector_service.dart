import '../../../../constant/enum/system/platform_types_enum.dart';

abstract class IPlatformSelectorService {
  PlatformTypesEnum? getCurrentPlatform();
}
