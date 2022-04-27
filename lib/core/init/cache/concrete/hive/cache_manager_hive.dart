import 'package:flutter/cupertino.dart';

import '../../../../constants/enum/cache/caching_keys_enum.dart';
import '../../../../constants/enum/theme/app_theme_types_enum.dart';
import '../../../../extension/cache_extension.dart';
import '../../abstract/ife_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManagerOfHive with ICacheManager {
  static CacheManagerOfHive? _instance;
  var authenticationBox;
  static CacheManagerOfHive? get instance {
    _instance ??= CacheManagerOfHive._init();
    return _instance;
  }

  CacheManagerOfHive._init() {
    initHive();
    populateBoxes();
  }

  @override
  Future<bool> ensureInit() {
    
    return Future.value(true);
  }

  @override
  AppThemeTypes getCurrentThme() {
    // TODO: implement getCurrentThme
    throw UnimplementedError();
  }

  @override
  Future<String> getAccesToken() async {
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    var accesToken =
        await authenticationBox.get(CachingKeys.ACCESS_TOKEN.toRaw);
    await authenticationBox.close();
    return accesToken;
  }

  @override
  Future<String> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAccesToken(String accesToken) async {
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(CachingKeys.ACCESS_TOKEN.toRaw, accesToken);
    await authenticationBox.close();
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

  // util metods

  void initHive() {
    Hive.init(cacheFoldername);
  }

  Future<void> populateBoxes() async {
    authenticationBox = await Hive.openBox(cacheAuthenticationName);
  }
}
