import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';

abstract class ICacheService {
  AppThemeTypes getCurrentThme();
  Future<bool> ensureInit();
}
