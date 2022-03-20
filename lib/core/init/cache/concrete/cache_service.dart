import '../../../constants/enum/app_theme_types_enum.dart';
import '../../../constants/enum/cache_manager_types_enum.dart';
import '../abstract/ife_cache_manager.dart';
import '../abstract/ife_cache_service.dart';
import 'shared_preferences/cache_manager_shared_preferences.dart';

class CacheService implements ICacheService {
  static final CacheService _instance = CacheService._init();
  late final ICacheManager _manager;
  static CacheService get instance => _instance;
  CacheService._init() {
    _manager = _selectManager(CacheManagerTypes.SHARED_PREFERENCES)!;
    ensureInit();
  }
  ICacheManager? _selectManager(CacheManagerTypes types) {
    switch (types) {
      case CacheManagerTypes.SHARED_PREFERENCES:
        return CacheManagerOfSharedPreferences.instance;

      default:
        return CacheManagerOfSharedPreferences.instance;
    }
  }

  @override
  Future<bool> ensureInit() async {
    return _manager.ensureInit();
  }

  @override
  AppThemeTypes getCurrentThme() {
    return _manager.getCurrentThme();
  }
}
