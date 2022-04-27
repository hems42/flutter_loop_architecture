import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';

import '../../../constants/enum/cache/cache_manager_types_enum.dart';
import '../../../constants/enum/theme/app_theme_types_enum.dart';
import '../abstract/ife_cache_manager.dart';
import '../abstract/ife_cache_service.dart';

class CacheService implements ICacheService {
  static final CacheService _instance = CacheService._init();
  late final ICacheManager _manager;
  static CacheService get instance => _instance;
  CacheService._init() {
    _manager = _selectManager(CacheManagerTypes.HIVE)!;
    ensureInit();
  }
  ICacheManager? _selectManager(CacheManagerTypes types) {
    switch (types) {
      case CacheManagerTypes.HIVE:
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
  AppThemeTypes getCurrentThme() {
    return _manager.getCurrentThme();
  }

  @override
  Future<String> getAccesToken() {
    return _manager.getAccesToken();
  }

  @override
  Future<String> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAccesToken(String AccesToken) async {
   await _manager.saveAccesToken(AccesToken);
    return true;
  }

  @override
  Future<String> saveRefreshToken(String refreshToken) {
    // TODO: implement saveRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<String> updateAccesToken(String AccesToken) {
    // TODO: implement updateAccesToken
    throw UnimplementedError();
  }

  @override
  Future<String> updateRefreshToken(String refreshToken) {
    // TODO: implement updateRefreshToken
    throw UnimplementedError();
  }
}
