import 'package:flutter_notebook/core/init/stuff/platform_selector/concrete/platform_selector_service.dart';

import '../../init/cache/concrete/cache_service.dart';
import '../../init/log/concrete/log_service.dart';
import '../../init/navigation/concrete/navigation_service.dart';

class CoreManagerWorkBench {
  static final CoreManagerWorkBench _instance = CoreManagerWorkBench._init();
  late final _cacheService;
  late final _navigationService;
  late final _logService;
  late final _platformSelectorService;
  static CoreManagerWorkBench get instance => _instance;
  CoreManagerWorkBench._init() {
    _cacheService = CacheService.instance;
    _navigationService = NavigationService.instance;
    _logService = LogService.instance;
    _platformSelectorService = PlatformSelectorService.instance;
  }

  get cacheService => _cacheService;
  get navigationService => _navigationService;
  get logService => _logService;
  get platformSelectorService => _platformSelectorService;
}
