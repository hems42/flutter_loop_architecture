import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_theme_model.dart';
import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';
import 'package:flutter_notebook/core/init/theme/abstract/ife_theme_manager.dart';

class ThemeManagerOfNotifier extends ChangeNotifier with IThemeManager {
  static late final ThemeManagerOfNotifier? _instance;
  static ThemeManagerOfNotifier get instance {
    _instance ??= ThemeManagerOfNotifier._init();
    return _instance!;
  }

  ThemeManagerOfNotifier._init();

  @override
  ThemeData get theme {
    return getCurrentThemeFromCache();
  }

  @override
  void changeTheme(AppThemeTypes type) {
    updateSelectedThemeOnCache(type);
    notifyListeners();
  }

  @override
  // TODO: implement themeModel
  IBaseThemeModel get themeModel => throw UnimplementedError();
}
