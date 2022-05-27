import 'package:flutter/material.dart';
import '../../../base/model/abstract/ife_base_theme_model.dart';
import '../../../constant/enum/theme/theme_types_enum.dart';
import '../../../constant/enum/theme/theme_manager_types_enum.dart';
import '../abstract/ife_theme_service.dart';
import 'notifier/theme_manager_notifier.dart';
import '../abstract/ife_theme_manager.dart';

class ThemeService implements IThemeService {
  static final ThemeService _instance = ThemeService._init();
  late final IThemeManager _manager;
  static ThemeService get instance => _instance;

  ThemeService._init() {
    _manager = _selectManager(ThemeManagerTypesEnum.NOTIFIER);
  }

  IThemeManager _selectManager(ThemeManagerTypesEnum types) {
    switch (types) {
      case ThemeManagerTypesEnum.NOTIFIER:
        return ThemeManagerOfNotifier.instance;
      default:
        return ThemeManagerOfNotifier.instance;
    }
  }

  @override
  void changeTheme(ThemeTypesEnum type) {
    _manager.changeTheme(type);
  }


  @override
  IBaseThemeModel get themeModel => _manager.themeModel;
  
  @override
  ThemeData get getStockTheme => _manager.getStockTheme;
}
