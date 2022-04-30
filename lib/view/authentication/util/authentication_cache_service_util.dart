import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_service.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';

mixin AuthenticationCacheServiceUtil {
  final ICacheService cacheService = CacheService.instance;
}
