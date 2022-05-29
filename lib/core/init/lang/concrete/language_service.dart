import 'package:flutter/cupertino.dart';
import '../abstract/ife_language_manager.dart';
import '../abstract/ife_language_service.dart';
import 'easy_localization/language_manager_easy_localization.dart';
import '../../../constant/enum/lang/language_types_enum.dart';
import '../../../constant/enum/lang/language_manager_types_enum.dart';

class LanguageService implements ILanguageService {
  static LanguageService? _instance;
  late final ILanguageManager? _manager;
  late final BuildContext _context;
  static LanguageService? Instance(BuildContext context) {
    _instance ??= LanguageService._init(context);
    return _instance;
  }

  LanguageService._init(BuildContext context) {
    _context = context;
    _manager = _selectManager(LanguageManagerTypesEnum.EASY_LOCALIZATION);
  }

  ILanguageManager? _selectManager(LanguageManagerTypesEnum types) {
    switch (types) {
      case LanguageManagerTypesEnum.EASY_LOCALIZATION:
        return LanguageManagerOfEasyLocalization.instance(_context);

      default:
        return LanguageManagerOfEasyLocalization.instance(_context);
    }
  }


  @override
  void changeLangue(LanguageTypesEnum type) {}

  @override
  BuildContext get context => _context;
}
