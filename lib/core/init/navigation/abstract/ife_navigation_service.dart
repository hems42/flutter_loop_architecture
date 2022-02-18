import 'package:flutter_notebook/core/constants/enum/app_navigation_animations_enum.dart';
import 'package:flutter_notebook/core/constants/navigation/navigation_constants.dart';

import '../../../constants/enum/app_navigation_pages_enum.dart';

abstract class INavigationService {
  Future<void> navigateToPage(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation});
  Future<void> navigateToPageClear(AppNavigationPagesEnum page,
      {Object? data, AppNavigationAnimationsEnum? selectedAnimation});

  dynamic getStuffUtilOfNavigationService();
}
