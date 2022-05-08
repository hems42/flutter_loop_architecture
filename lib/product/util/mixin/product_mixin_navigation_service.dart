import '../../../core/init/navigation/abstract/ife_navigation_service.dart';
import '../../../core/init/navigation/concrete/navigation_service.dart';

mixin ProductMixinNavigationService{
  final INavigationService navigationService = NavigationService.instance;
  }