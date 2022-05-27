import 'package:flutter/material.dart';
import '../../../base/model/abstract/ife_base_theme_model.dart';
import '../concrete/themes/custom_theme_dark.dart';
import '../concrete/themes/custom_theme_light.dart';
import '../../../util/workbench/core_service_workbench.dart';
import '../../../constant/enum/theme/theme_types_enum.dart';
import '../../cache/abstract/ife_cache_service.dart';
import 'ife_theme_service.dart';

mixin IThemeManager implements IThemeService {
  final ICacheService cacheService = CoreServiceWorkBench.cacheService;

  late IBaseThemeModel currentTheme;
  late ThemeData currentStockTheme;

  IBaseThemeModel getCurrentThemeFromCache() {
    return selectThemeFromAppThemeTypes(cacheService.getCurrentTheme());
  }

  void updateSelectedThemeOnCache(ThemeTypesEnum type) {}

  IBaseThemeModel selectThemeFromAppThemeTypes(ThemeTypesEnum type) {
    switch (type) {
      case ThemeTypesEnum.CUSTOM_THEME_DARK:
        return CustomThemeDark();

      case ThemeTypesEnum.CUSTOM_THEME_LIGHT:
        return CustomThemeLight();

      default:
        return CustomThemeLight();
    }
  }
}
