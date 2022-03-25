import 'package:flutter/material.dart';
import '../../../base/model/abstract/ife_base_theme_model.dart';
import '../../../constants/enum/theme/app_theme_types_enum.dart';

abstract class IThemeService {
  ThemeData get theme;

  IBaseThemeModel get themeModel;

  void changeTheme(AppThemeTypes type);
}
