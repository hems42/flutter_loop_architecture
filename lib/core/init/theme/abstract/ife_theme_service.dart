import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_theme_model.dart';
import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';

abstract class IThemeService {

  ThemeData get theme;

  IBaseThemeModel get themeModel;

  void changeTheme(AppThemeTypes type);
}
