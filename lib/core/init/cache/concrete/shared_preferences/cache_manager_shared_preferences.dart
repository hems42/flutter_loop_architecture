import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';

import 'ife_cache_manager_shared_preferences.dart';

class CacheManagerOfSharedPreferences
    implements ICacheManagerOfSharedPreferences {
  static final CacheManagerOfSharedPreferences? _instance =
      CacheManagerOfSharedPreferences._init();
  static CacheManagerOfSharedPreferences? get instance => _instance;
  CacheManagerOfSharedPreferences._init();
  @override
  Future<bool> ensureInit() {
    print("emin olundu cache başlatıldı");
    return Future.value(true);
  }

  @override
  AppThemeTypes getCurrentThme() {
    return AppThemeTypes.CUSTOM_THEME_DARK;
  }
}
