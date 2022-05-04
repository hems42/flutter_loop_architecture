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

  ThemeManagerOfNotifier._init();

  @override
  ThemeData get theme {
    return getCurrentThemeFromCache();
  }

  @override
  void changeTheme(ThemeTypes type) {
    updateSelectedThemeOnCache(type);
    notifyListeners();
  }

  @override
  // TODO: implement themeModel
  IBaseThemeModel get themeModel => throw UnimplementedError();
}
