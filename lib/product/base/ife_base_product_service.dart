import '../../core/init/navigation/abstract/ife_navigation_service.dart';
import '../../core/init/navigation/concrete/navigation_service.dart';
import '../../core/init/cache/abstract/ife_cache_service.dart';
import '../../core/init/cache/concrete/cache_service.dart';
import '../../core/init/network/abstract/ife_network_service.dart';
import '../../core/init/network/concrete/network_service.dart';

abstract class IBaseProductService {
  final INetworService networkService = NetworkService.instance;
  final ICacheService cacheService = CacheService.instance;
  final INavigationService navigationService = NavigationService.instance;
}
