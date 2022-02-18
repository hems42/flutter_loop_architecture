import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_service.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_notebook/core/init/theme/abstract/ife_theme_service.dart';

mixin IThemeManager implements IThemeService {
  final ICacheService getCacheService = CacheService.instance;

  ThemeData getCurrentThemeFromCache() {
    return selectThemeFromAppThemeTypes(getCacheService.getCurrentThme());
  }

  
  void  updateSelectedThemeOnCache(AppThemeTypes type)
  {
      
  }

  ThemeData selectThemeFromAppThemeTypes(AppThemeTypes type) {
    switch (type) {
      case AppThemeTypes.CUSTOM_THEME_DARK:
        return ThemeData.light();

      default:
        return ThemeData.dark();
    }
  }
}
