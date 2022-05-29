import 'package:flutter/cupertino.dart';
import '../../../constant/enum/lang/language_types_enum.dart';

abstract class ILanguageService {

  void changeLangue(LanguageTypesEnum type);

  BuildContext get context;
}
