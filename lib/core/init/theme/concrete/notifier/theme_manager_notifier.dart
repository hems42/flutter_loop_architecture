import 'package:flutter/material.dart';
import '../../../../base/model/abstract/ife_base_theme_model.dart';
import '../../../../constant/enum/theme/theme_types_enum.dart';
import '../../abstract/ife_theme_manager.dart';

class ThemeManagerOfNotifier extends ChangeNotifier with IThemeManager {
  static late final ThemeManagerOfNotifier? _instance;
  static ThemeManagerOfNotifier get instance {
    _instance ??= ThemeManagerOfNotifier._init();
    return _instance!;
  }

  ThemeManagerOfNotifier._init() {
    currentTheme = getCurrentThemeFromCache();
    currentStockTheme = ThemeData();
  }

  @override
  void changeTheme(ThemeTypesEnum type) {
    updateSelectedThemeOnCache(type);
    notifyListeners();
  }

  @override
  IBaseThemeModel get themeModel => currentTheme;

  @override
  ThemeData get getStockTheme => currentStockTheme;
}
