import 'package:flutter/material.dart';
import '../../../util/workbench/core_service_workbench.dart';
import '../../../constant/enum/lang/language_types_enum.dart';
import 'ife_language_service.dart';
import '../../cache/abstract/ife_cache_service.dart';

mixin ILanguageManager implements ILanguageService {
  final ICacheService getCacheService = CoreServiceWorkBench.cacheService;
  @override
  late final BuildContext context;
  void setContext(BuildContext context) {
    this.context = context;
  }

  void updateSelectedLanguage(LanguageTypesEnum type) {}

}
