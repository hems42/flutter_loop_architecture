import '../../../constant/enum/cache/cache_manager_types_enum.dart';
import '../../../constant/enum/theme/theme_types_enum.dart';
import 'hive/cache_manager_hive.dart';
import '../abstract/ife_cache_manager.dart';
import '../abstract/ife_cache_service.dart';

class CacheService implements ICacheService {
  static final CacheService _instance = CacheService._init();
  late final ICacheManager _manager;
  static CacheService get instance => _instance;
  CacheService._init() {
    _manager = _selectManager(CacheManagerTypesEnum.HIVE)!;
    ensureInit();
  }
  ICacheManager? _selectManager(CacheManagerTypesEnum types) {
    switch (types) {
      case CacheManagerTypesEnum.HIVE:
        return CacheManagerOfHive.instance;

      default:
        return CacheManagerOfHive.instance;
    }
  }

  @override
  Future<bool> ensureInit() async {
    return _manager.ensureInit();
  }

  @override
  ThemeTypesEnum getCurrentThme() {
    return _manager.getCurrentThme();
  }

  // access token
  @override
  Future<String?> getAccessToken({Function(String? email)? checkEmail}) {
    return _manager.getAccessToken(checkEmail: checkEmail);
  }

  @override
  Future<bool> deleteAccesToken({String? email, checkEmail(String? email)?}) {
    return _manager.deleteAccesToken(checkEmail: checkEmail, email: email);
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) {
    return _manager.saveAccesToken(accesToken, email: email);
  }

  @override
  Future<bool> updateAccesToken(String accesToken, {String? email}) {
    return _manager.updateAccesToken(accesToken, email: email);
  }

  // refresh token
  @override
  Future<String?> getRefreshToken({Function(String? email)? checkEmail}) {
    return _manager.getRefreshToken(checkEmail: checkEmail);
  }

  @override
  Future<bool> deleteRefreshToken({String? email, checkEmail(String? email)?}) {
    return _manager.deleteRefreshToken(checkEmail: checkEmail, email: email);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) {
    return _manager.saveRefreshToken(refreshToken, email: email);
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) {
    return _manager.updateRefreshToken(refreshToken, email: email);
  }
}
