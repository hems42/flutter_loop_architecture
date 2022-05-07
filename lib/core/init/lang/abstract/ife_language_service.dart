import 'package:flutter/cupertino.dart';
import '../../../base/model/abstract/ife_base_language_keys_model.dart';
import '../../../constant/enum/lang/language_types_enum.dart';

abstract class ILanguageService {
  IBaseLanguageKeysModel getLanguageKeys();

  void changeLangue(LanguageTypesEnum type);

  dynamic getUtilStuffOfLanguageService();

  BuildContext get context;
}
