import 'package:flutter/material.dart';
import '../../../base/model/abstract/ife_base_theme_model.dart';
import '../../../constant/enum/theme/app_theme_types_enum.dart';
import '../../../constant/enum/theme/theme_manager_types_enum.dart';
import '../abstract/ife_theme_service.dart';
import 'theme_notifier/theme_manager_notifier.dart';
import '../abstract/ife_theme_manager.dart';

class ThemeService implements IThemeService {
  static final ThemeService _instance = ThemeService._init();
  late final IThemeManager? _manager;
  static ThemeService get instance => _instance;

  ThemeService._init() {
    _manager = _selectManager(ThemeManagerTypes.NOTIFIER);
  }

  IThemeManager _selectManager(ThemeManagerTypes types) {
    switch (types) {
      case ThemeManagerTypes.NOTIFIER:
        return ThemeManagerOfNotifier.instance;
      default:
        return ThemeManagerOfNotifier.instance;
    }
  }

  @override
  void changeTheme(AppThemeTypes type) {
    _manager!.changeTheme(type);
  }

  @override
  // TODO: implement theme
  ThemeData get theme => _manager!.theme;

  @override
  // TODO: implement themeModel
  IBaseThemeModel get themeModel => _manager!.themeModel;
}
