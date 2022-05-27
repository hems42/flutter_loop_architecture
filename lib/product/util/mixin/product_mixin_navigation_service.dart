import '../../../core/util/workbench/core_service_workbench.dart';
import '../../../core/init/navigation/abstract/ife_navigation_service.dart';

mixin ProductMixinNavigationService {
  final INavigationService navigationService =
      CoreServiceWorkBench.navigationService;
}
