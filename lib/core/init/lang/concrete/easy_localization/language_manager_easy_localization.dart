import 'package:easy_localization/easy_localization.dart';
import "package:flutter/material.dart";
import '../../../../constant/enum/lang/language_types_enum.dart';
import '../../abstract/ife_language_manager.dart';
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

  Locale _convertAppLanguageTypeToLocale(LanguageTypes types) {
    switch (types) {
      case LanguageTypes.ENGLISH:
        return enLocale;

      case LanguageTypes.TURKISH:
        return trLocale;
      default:
        return enLocale;
    }
  }

  @override
  void changeLangue(LanguageTypes type) {
    context.setLocale(_convertAppLanguageTypeToLocale(type));
    updateSelectedLanguage(type);
  }
}
