// ignore_for_file: unnecessary_null_comparison
import '../../../../constants/enum/cache/caching_keys_enum.dart';
import '../../../../constants/enum/theme/app_theme_types_enum.dart';

import '../../abstract/ife_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManagerOfHive with ICacheManager {
  static CacheManagerOfHive? _instance;
  bool isInitialized = false;
  var authenticationBox;
  static CacheManagerOfHive? get instance {
    _instance ??= CacheManagerOfHive._init();
    return _instance;
  }

  CacheManagerOfHive._init() {
    initHive();
  }

  @override
  Future<bool> ensureInit() {
    if (!isInitialized) {
      initHive();
    }
    return Future.value(true);
  }

  @override
  AppThemeTypes getCurrentThme() {
    throw UnimplementedError();
  }

  @override
  Future<String> getAccesToken({String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String accessToken = await authenticationBox.get(accessTokenSearchItem);
    authenticationBox.close();
    return accessToken;
  }

  @override
  Future<String> getRefreshToken({String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String refreshToken = await authenticationBox.get(refreshTokenSearchItem);
    await authenticationBox.close();
    return refreshToken;
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(accessTokenSearchItem, accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateAccesToken(String accesToken, {String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(accessTokenSearchItem, accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeys.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
  }

  // util metods

  void initHive() {
    Hive.init(cacheFoldername);
    isInitialized = true;
  }

 }
