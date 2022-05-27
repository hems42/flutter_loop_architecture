import '../../../core/util/workbench/core_service_workbench.dart';
import '../../../core/init/cache/abstract/ife_cache_service.dart';

mixin ProductMixinCacheService {
  final ICacheService cacheService = CoreServiceWorkBench.cacheService;
}
