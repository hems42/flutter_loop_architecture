import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_notebook/core/init/log/concrete/log_service.dart';
import 'package:flutter_notebook/core/init/navigation/concrete/navigation_service.dart';

class CoreManagerWorkBench {
  static final CoreManagerWorkBench _instance = CoreManagerWorkBench._init();
  late final _cacheService;
  late final _navigationService;
  late final _logService;
  static CoreManagerWorkBench get instance => _instance;
  CoreManagerWorkBench._init() {
    _cacheService = CacheService.instance;
    _navigationService = NavigationService.instance;
    _logService = LogService();
  }

  get cacheService => _cacheService;
  get navigationService => _navigationService;
  get logService => _logService;
}
