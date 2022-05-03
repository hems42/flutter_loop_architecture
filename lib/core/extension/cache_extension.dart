
import '../constant/enum/cache/caching_keys_enum.dart';

extension ExtensionOfCachingKeys on CachingKeys {
  String get toRaw {
    switch (this) {
      case CachingKeys.ACCESS_TOKEN:
        return 'ACCESS_TOKEN';

      case CachingKeys.REFRESH_TOKEN:
        return 'REFRESH_TOKEN';

      case CachingKeys.SELECTED_THEME:
        return 'SELECTED_THEME';

      case CachingKeys.ACCESS_TOKEN:
        return 'ACCESS_TOKEN';
      default:
       return 'NOT_SELECTED';
    }
  }
}
