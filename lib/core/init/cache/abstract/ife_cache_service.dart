import 'package:flutter_notebook/core/constants/enum/app_theme_types_enum.dart';

abstract class ICacheService {
  AppThemeTypes getCurrentThme();
  Future<bool> ensureInit();

  // acces token save

  // refresh token

  // settings

  // init settings

  // save models

  // save personel inf

  // hash-encode data

}
