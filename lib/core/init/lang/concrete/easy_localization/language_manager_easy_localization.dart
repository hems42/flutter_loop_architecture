import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/constants/enum/app_language_types_enum.dart';
import 'package:flutter_notebook/core/init/lang/abstract/ife_language_manager.dart';
import 'package:flutter_notebook/core/init/lang/concrete/easy_localization/locale_keys.g.dart';

import '../../../../base/model/abstract/ife_base_language_keys_model.dart';

class LanguageManagerOfEasyLocalization with ILanguageManager {
  static LanguageManagerOfEasyLocalization? _instance;

  static LanguageManagerOfEasyLocalization? instance(BuildContext context) {
    _instance ??= LanguageManagerOfEasyLocalization._init(context);

    return _instance;
  }

  LanguageManagerOfEasyLocalization._init(BuildContext context) {
    super.setContext(context);
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];

  @override
  void dene2() {
    print("easylocale çalşıtı dene 2");
  }

  @override
  IBaseLanguageKeysModel getLanguageKeys() {
    // TODO: implement getLanguageKeys
    throw UnimplementedError();
  }

  @override
  dynamic getUtilStuffOfLanguageService() {
    return this;
  }

  Locale _convertAppLanguageTypeToLocale(AppLanguageTypes types) {
    switch (types) {
      case AppLanguageTypes.ENGLISH:
        return enLocale;

      case AppLanguageTypes.TURKISH:
        return trLocale;
      default:
        return enLocale;
    }
  }

  @override
  void changeLangue(AppLanguageTypes type) {
    context.setLocale(_convertAppLanguageTypeToLocale(type));
    updateSelectedLanguage(type);
  }
}
