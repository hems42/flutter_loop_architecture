import '../../init/theme/abstract/ife_theme_service.dart';
import '../../init/theme/concrete/theme_service.dart';
import '../../init/cache/abstract/ife_cache_service.dart';
import '../../init/log/abstract/ife_log_service.dart';
import '../../init/navigation/abstract/ife_navigation_service.dart';
import '../../init/network/concrete/network_service.dart';
import '../../init/stuff/platform_selector/abstract/ife_platform_selector_service.dart';
import '../../init/stuff/platform_selector/concrete/platform_selector_service.dart';
import '../../init/cache/concrete/cache_service.dart';
import '../../init/log/concrete/log_service.dart';
import '../../init/navigation/concrete/navigation_service.dart';

class CoreServiceWorkBench {
  static final _cacheService = CacheService.instance;
  static final _navigationService = NavigationService.instance;
  static final _networkService = NetworkService.instance;
  static final _logService = LogService.instance;
  static final _platformSelectorService = PlatformSelectorService.instance;
  static final _themeService = ThemeService.instance;

  static ICacheService get cacheService => _cacheService;
  static INavigationService get navigationService => _navigationService;
  static NetworkService get networkService => _networkService;
  static ILogService get logService => _logService;
  static IPlatformSelectorService get platformSelectorService =>
      _platformSelectorService;
  static IThemeService get themeService => _themeService;
}
