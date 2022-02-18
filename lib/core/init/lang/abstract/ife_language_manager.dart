import 'package:flutter/cupertino.dart';
import 'package:flutter_notebook/core/constants/enum/app_language_types_enum.dart';
import 'package:flutter_notebook/core/init/lang/abstract/ife_language_service.dart';

import '../../cache/abstract/ife_cache_service.dart';
import '../../cache/concrete/cache_service.dart';

mixin ILanguageManager implements ILanguageService {
  final ICacheService getCacheService = CacheService.instance;
  @override
  late final BuildContext context;
  void setContext(BuildContext context) {
    this.context = context;
  }

  void updateSelectedLanguage(AppLanguageTypes type){}
  void dene2();
}
