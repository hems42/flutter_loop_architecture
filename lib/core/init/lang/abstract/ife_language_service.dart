import 'package:flutter/cupertino.dart';
import 'package:flutter_notebook/core/constants/enum/app_language_types_enum.dart';

import '../../../base/model/abstract/ife_base_language_keys_model.dart';

abstract class ILanguageService {
  IBaseLanguageKeysModel getLanguageKeys();

  void changeLangue(AppLanguageTypes type);

  dynamic getUtilStuffOfLanguageService();

  BuildContext get context;
}
