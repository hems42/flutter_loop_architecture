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

  @override
  Future<String> getRefreshToken({String? email}) {
    return _manager.getRefreshToken(email: email);
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) {
    return _manager.saveAccesToken(accesToken, email: email);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) {
    return _manager.saveRefreshToken(refreshToken, email: email);
  }

  @override
  Future<bool> updateAccesToken(String AccesToken, {String? email}) {
    return _manager.updateAccesToken(AccesToken, email: email);
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) {
    return _manager.updateRefreshToken(refreshToken, email: email);
  }

  @override
  Future<bool> deleteAccesToken({String? email, checkEmail (String? email)?}) {
    // TODO: implement deleteAccesToken
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteRefreshToken(String refreshToken, {String? email}) {
    // TODO: implement deleteRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<String?> getAccessToken({Function(String? email)? checkEmail}) {
    return _manager.getAccessToken(checkEmail: checkEmail);
  }

}
