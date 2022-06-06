import 'package:flutter_notebook/core/constant/enum/cache/cache_property_types_enum.dart';

import 'package:flutter_notebook/core/constant/enum/cache/cache_metods_enum.dart';

import 'package:flutter_notebook/core/base/model/abstract/ife_base_cache_response_model.dart';

import 'package:flutter_notebook/core/base/model/abstract/ife_base_cache_request_model.dart';

import '../../../constant/enum/cache/caching_keys_enum.dart';
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
  ThemeTypesEnum getCurrentTheme() {
    return _manager.getCurrentTheme();
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

  @override
  Future deleteValue(CachingKeysEnum cachingKey, {String? cacheTopic, cacheUtil}) {
    // TODO: implement deleteValue
    throw UnimplementedError();
  }

  @override
  Future getValue(CachingKeysEnum cachingKey, {String? cacheTopic, cacheUtil}) {
    // TODO: implement getValue
    throw UnimplementedError();
  }

  @override
  Future saveValue(CachingKeysEnum cachingKey, valueForSave, {String? cacheTopic, cacheUtil}) {
    // TODO: implement saveValue
    throw UnimplementedError();
  }

  @override
  Future updateValue(CachingKeysEnum cachingKey, valueForSave, {String? cacheTopic, cacheUtil}) {
    // TODO: implement updateValue
    throw UnimplementedError();
  }

  @override
  Future<IBaseCacheResponseModel> cacheModel(IBaseCacheRequestModel cacheRequestModel, {required CacheMethodsEnum cacheMetodEnum, CachingKeysEnum? cachingKey, CachePropertTypesEnum? cachePropertyType, String? cacheTopic}) {
    // TODO: implement cacheModel
    throw UnimplementedError();
  }
}
