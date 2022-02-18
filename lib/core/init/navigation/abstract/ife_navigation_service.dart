
import '../../../constants/enum/app_navigation_pages_enum.dart';

abstract class INavigationService {
  Future<void> navigateToPage(AppNavigationPagesEnum page, {Object? data});
  Future<void> navigateToPageClear(AppNavigationPagesEnum page,{Object? data});
}
