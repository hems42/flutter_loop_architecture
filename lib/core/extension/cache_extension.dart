import '../constant/enum/cache/caching_keys_enum.dart';

extension ExtensionOfCachingKeys on CachingKeysEnum {
  String get toRaw {
    switch (this) {
      case CachingKeysEnum.ACCESS_TOKEN:
        return 'ACCESS_TOKEN';

      case CachingKeysEnum.REFRESH_TOKEN:
        return 'REFRESH_TOKEN';

      case CachingKeysEnum.SELECTED_THEME:
        return 'SELECTED_THEME';

      case CachingKeysEnum.ACCESS_TOKEN:
        return 'ACCESS_TOKEN';
      default:
        return 'NOT_SELECTED';
    }
  }
}
