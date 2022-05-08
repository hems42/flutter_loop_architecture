import '../../../core/init/cache/abstract/ife_cache_service.dart';
import '../../../core/init/cache/concrete/cache_service.dart';

mixin CoreMixinCacheService {
  final ICacheService cacheService = CacheService.instance;
}
