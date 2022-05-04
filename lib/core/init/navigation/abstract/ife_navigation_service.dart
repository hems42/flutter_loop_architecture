import '../../../constant/enum/navigation/navigation_animations_enum.dart';
import '../../../constant/enum/navigation/navigation_pages_enum.dart';

abstract class INavigationService {
  Future<void> navigateToPage(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation});
  Future<void> navigateToPageClear(NavigationPagesEnum page,
      {Object? data, NavigationAnimationsEnum? selectedAnimation});

  dynamic getStuffUtilOfNavigationService();
}
