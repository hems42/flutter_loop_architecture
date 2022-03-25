import 'package:flutter/material.dart';
import '../../../constants/enum/theme/app_theme_types_enum.dart';
import '../../cache/abstract/ife_cache_service.dart';
import '../../cache/concrete/cache_service.dart';
import 'ife_theme_service.dart';

mixin IThemeManager implements IThemeService {
  final ICacheService getCacheService = CacheService.instance;

  ThemeData getCurrentThemeFromCache() {
    return selectThemeFromAppThemeTypes(getCacheService.getCurrentThme());
  }

  void updateSelectedThemeOnCache(AppThemeTypes type) {}

  ThemeData selectThemeFromAppThemeTypes(AppThemeTypes type) {
    switch (type) {
      case AppThemeTypes.CUSTOM_THEME_DARK:
        return ThemeData.light();

      default:
        return ThemeData.dark();
    }
  }
}
