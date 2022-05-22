import 'package:flutter/material.dart';
import '../../../constant/enum/theme/theme_types_enum.dart';
import '../../cache/abstract/ife_cache_service.dart';
import '../../cache/concrete/cache_service.dart';
import 'ife_theme_service.dart';

mixin IThemeManager implements IThemeService {
  final ICacheService getCacheService = CacheService.instance;

  ThemeData getCurrentThemeFromCache() {
    return selectThemeFromAppThemeTypes(getCacheService.getCurrentTheme());
  }

  void updateSelectedThemeOnCache(ThemeTypesEnum type) {}

  ThemeData selectThemeFromAppThemeTypes(ThemeTypesEnum type) {
    switch (type) {
      case ThemeTypesEnum.CUSTOM_THEME_DARK:
        return ThemeData.light();

      default:
        return ThemeData.dark();
    }
  }
}
